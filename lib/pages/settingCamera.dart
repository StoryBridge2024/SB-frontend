import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/pages/showFairytale.dart';
import 'package:frontend/services/mediapipe/pose_detector_view.dart';
import 'package:frontend/constants/fairytaleConstants.dart';

class SettingCam extends StatelessWidget {
  SettingCam({super.key, required this.face, required this.body});

  var face;
  var body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFC9EEFF),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '캐릭터 카메라 세팅',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.all(25),
                  child: Content(body: body, face: face),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  Content({super.key, required this.body, required this.face});

  var body;
  var face;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: PoseDetectorView(
            face: face,
            images: body,
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: TurnButtons(),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      clr_index.value = 0;
                      Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowFairytale(images: body, face: face)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TurnButtons extends StatelessWidget {
  const TurnButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "카메라 회전",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  FloatingActionButton.large(
                    backgroundColor: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 95,
                    ),
                    onPressed: () {
                      cameraTurn += 1;
                      if (cameraTurn == 4) cameraTurn = 0;
                    },
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "캐릭터 회전",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  FloatingActionButton.large(
                    backgroundColor: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 95,
                    ),
                    onPressed: () {
                      characterTurn += 1;
                      if (characterTurn == 4) characterTurn = 0;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
