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
                '동화 만들기',
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

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    var images = widget.images;
    var face = widget.face;

    ValueNotifier(clr_index);
    return ValueListenableBuilder<int>(
      valueListenable: clr_index,
      builder: (context, value, _) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
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
                        flex: 1,
                        child: Container(),
                      ),
                      Flexible(
                        flex: 10,
                        child: Container(
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
        );
      },
    );
  }
}
