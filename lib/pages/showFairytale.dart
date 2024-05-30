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
              flex: 2,
              child: Container(
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
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      );
    }
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: 1500,
            height: 700,
            child: Book(),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: 500,
            height: 500,
            child: Story(images: images, face: face),
          ),
        )
      ],
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
                  child: Stack(
                    children: [
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
                child: Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}
