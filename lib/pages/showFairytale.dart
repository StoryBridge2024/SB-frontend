import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:frontend/pages/makingFairytale.dart';
import 'package:frontend/services/mediapipe/pose_detector_view.dart';
import '../models/scene_model.dart';
import 'package:frontend/constants/dummy_data.dart';

late final SceneModel gSceneModel;

class ShowFairytale extends StatelessWidget {
  ShowFairytale({super.key, required this.images});

  List<Uint8List> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(0xFF, 0xB9, 0xEE, 0xFF),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '동화 만들기',
                style: TextStyle(
                  fontSize: 60,
                  color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFFFFFFF),
                margin: EdgeInsets.all(25),
                child: Story(images: images),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Story extends StatefulWidget {
  Story({super.key, required this.images});

  var images;

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  //int index = 0;
  int max = 8;

  @override
  Widget build(BuildContext context) {
    var images = widget.images;

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
                        left: locX.elementAt(value) - 100,
                        right: locY.elementAt(value) - 100,
                        child: Container(
                          width: 500,
                          height: 500,
                          child: Image.asset(
                            imgs.elementAt(value),
                          ),
                          //                      child: Image.asset(gSceneModel.b64_images[index]),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          height: 1000,
                          width: 1000,
                          child: Transform.scale(
                            scale: 0.8,
                            child: Transform.rotate(
                              angle: 3.141592 * (3 / 2),
                              child: PoseDetectorView(images: images),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Camera(),
                      )
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
                        flex: 3,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            texts.elementAt(value),
                            //                        gSceneModel.scriptModelList[index].scene_contents,
                            style: TextStyle(fontSize: 40),
                          ),
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
