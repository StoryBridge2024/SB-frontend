import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/constants/dummy_data.dart';
import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:frontend/pages/book.dart';
import 'package:frontend/services/mediapipe/pose_detector_view.dart';

class ShowFairytale extends StatelessWidget {
  ShowFairytale({super.key, required this.images, required this.face});

  List<Uint8List> images;
  Widget face;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < NUMBER_OF_SCENE; i++) {
      pages[i] = Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                alignment: Alignment.center,
                child: (useDummy)
                    ? Text(
                        missions[i],
                        style: TextStyle(fontSize: 60, fontFamily: 'MOVE'),
                      )
                    : Text(
                        gSceneModel!
                            .scriptModelList[i].action_used_in_action_list!,
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
                child: (useDummy)
                    ? Text(
                        texts[i],
                        style: TextStyle(fontSize: 30, fontFamily: 'DDO'),
                      )
                    : Text(
                        gSceneModel!.scriptModelList[i].scene_contents,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'DDO',
                        ),
                      ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      );
    }
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Book(),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            bottom: 0,
            child: IgnorePointer(
              ignoring: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Story(images: images, face: face),
              ),
            ),
          ),
        ],
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

class _StoryState extends State<Story> with SingleTickerProviderStateMixin {
  bool _showStamp = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: _characterAndCamera(),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: _stamp(),
          ),
        ),
      ],
    );
  }

  Widget _characterAndCamera() {
    var images = widget.images;
    var face = widget.face;
    return ValueListenableBuilder<int>(
      valueListenable: clr_index,
      builder: (context, value, _) {
        if (clr_index.value == 0) {
          return Container();
        }
        if (clr_index.value - 1 == NUMBER_OF_SCENE) {
          return Container();
        }
        return Container(
          width: 600,
          height: 600,
          child: Transform.scale(
            scale: 1,
            child: PoseDetectorView(images: images, face: face),
          ),
        );
      },
    );
  }

  Widget _stamp() {
    return ValueListenableBuilder(
      valueListenable: ValueNotifier<bool>(_showStamp),
      builder: (context, value, _) {
        if (!_showStamp) return Container();
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/image/stamp.png',
              width: 350,
            ),
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
