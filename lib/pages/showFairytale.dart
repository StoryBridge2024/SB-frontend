import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/services/mediapipe/pose_detector_view.dart';
import 'package:frontend/constants/dummy_data.dart';
import 'package:frontend/constants/action_list.dart';
import 'package:frontend/constants/fairytaleConstants.dart';
import 'dart:async';

import '../constants/fairytaleConstants.dart';

class ShowFairytale extends StatelessWidget {
  ShowFairytale({super.key, required this.images, required this.face});

  List<Uint8List> images;
  Widget face;

  @override
  Widget build(BuildContext context) {
    clr_index.value = 0;
    return Scaffold(
      body: Container(
        color: Color.fromARGB(0xFF, 0xC9, 0xEE, 0xFF),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '동화 보기',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(0xFF, 0x13, 0x13, 0x13),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFFFFFFF),
                margin: EdgeInsets.all(25),
                child: Story(images: images, face: face),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Story extends StatefulWidget {
  Story({super.key, required this.images, required this.face});

  List<Uint8List> images;
  Widget face;

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> with SingleTickerProviderStateMixin{
  bool _showStamp = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  //late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 2.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    // Define the shake animation
    // _shakeAnimation = Tween<double>(begin: 0, end: 5).chain(
    //   CurveTween(curve: Curves.elasticIn),
    // ).animate(_controller);

    // Listen to missionclear changes
    missionclear.addListener(() {
      if (missionclear.value) {
        _showStampEffect();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var images = widget.images;
    var face = widget.face;

    ValueNotifier(clr_index);
    return ValueListenableBuilder<int>(
      valueListenable: clr_index,
      builder: (context, value, _) {
        return Container(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 500,
                              height: 500,
                              child: Image.memory(
                                base64Decode(gSceneModel!.b64_images
                                    .elementAt(clr_index.value)),
                                height: 500,
                                width: 500,
                              ),
                              //child: Image.asset(imgs.elementAt(clr_index.value)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: 500,
                              height: 500,
                              child: Transform.scale(
                                scale: 1,
                                child: PoseDetectorView(images: images, face: face),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                gSceneModel!.scriptModelList[clr_index.value]
                                    .action_used_in_action_list!,
                                style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: 'MOVE',
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 8,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                gSceneModel!.scriptModelList[clr_index.value]
                                    .scene_contents,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'DDO',
                                ),
              //                            texts.elementAt(clr_index.value),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: (clr_index.value == 0)
                                      ? Container()
                                      : Container(
                                          alignment: Alignment.bottomLeft,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back,
                                            ),
                                            onPressed: () {
                                              if (clr_index.value != 0)
                                                clr_index.value -= 1;
                                            },
                                          ),
                                        ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: (clr_index.value == NUMBER_OF_SCENE - 1)
                                      ? Container()
                                      : Container(
                                          alignment: Alignment.bottomRight,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward,
                                            ),
                                            onPressed: () {
                                              if (clr_index.value <
                                                  NUMBER_OF_SCENE - 1)
                                                clr_index.value += 1;
                                            },
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (_showStamp)
                Positioned(
                  right:150,
                  top:-90,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      // return Transform.translate(
                      //   offset: Offset(_shakeAnimation.value, _shakeAnimation.value),
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: child,
                        // ),
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 300,
                        child: Image.asset('assets/image/stamp.png')
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showStampEffect() {
    setState(() {
      _showStamp = true;
    });

    _controller.forward(from: 0).then((_) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _showStamp = false;
        });
        missionclear.value = false; // Reset missionclear to false
      });
    });
  }
}
