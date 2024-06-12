import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'dart:math';
import 'package:frontend/constants/dummy_data.dart';
import 'package:frontend/constants/fairytaleConstants.dart';

class MovementFollow extends StatefulWidget {
  const MovementFollow(
      {super.key,
      required this.poses,
      required this.images,
      required this.face});

  final List<Pose> poses;
  final List<Uint8List> images;
  final Widget face;

  @override
  State<MovementFollow> createState() => _MovementFollowState();
}

class _MovementFollowState extends State<MovementFollow> {
  int x = 250;
  int y = 250;
  double rate = 0.5;

  double lengthX(var p1, var p2) {
    double x1 = p1!.x;
    double x2 = p2!.x;

    double x = (x1 - x2);
    if (x < 0) x = -x;

    return x;
  }

  double lengthY(var p1, var p2) {
    double y1 = p1!.y;
    double y2 = p2!.y;

    double y = (y1 - y2);
    if (y < 0) y = -y;

    return y;
  }

  double length(var p1, var p2) {
    double x1 = p1!.x;
    double x2 = p2!.x;
    double y1 = p1!.y;
    double y2 = p2!.y;

    double x = pow(x1 - x2, 2) as double;
    double y = pow(y1 - y2, 2) as double;
    double dist = pow(x + y, 1 / 2) as double;

    return dist;
  }

  double angle(var p1, var p2) {
    double x1 = p1!.x;
    double x2 = p2!.x;
    double y1 = p1!.y;
    double y2 = p2!.y;

    double angle = -atan2(y2 - y1, x2 - x1);

    return angle;
  }

  Widget _arm(var middleX, var middleY, var p1, var p2, var image) {
    return Positioned(
      right:
          ((((p1!.x + p2!.x) / 2) - length(p2, p1) * 0.6) - middleX) * rate + x,
      top:
          ((((p1!.y + p2!.y) / 2) - length(p2, p1) * 0.6) - middleY) * rate + y,
      child: Container(
        width: length(p2, p1) * 1.2 * rate,
        height: length(p2, p1) * 1.2 * rate,
        child: Transform.rotate(
          angle: angle(p1, p2),
          child: Container(
            width: double.infinity,
            child: Image.memory(image),
          ),
        ),
      ),
    );
  }

  Widget _body(
      var middleX, var middleY, var p1, var p2, var p3, var p4, var image) {
    return Positioned(
      right: ((((p1!.x + p2!.x + p3!.x + p4!.x) / 4) - length(p4, p1) * 0.5) -
                  middleX) *
              rate +
          x,
      top: ((((p1!.y + p2!.y + p3!.y + p4!.y) / 4) - length(p4, p1) * 0.5) -
                  middleY) *
              rate +
          y,
      child: Container(
        width: length(p4, p1) * 1 * rate,
        height: length(p4, p1) * 1 * rate,
        child: Transform.rotate(
          angle: angle(p2, p1),
          child: Container(
            width: double.infinity,
            child: Image.memory(image),
          ),
        ),
      ),
    );
  }

  Widget _leg(var middleX, var middleY, var p1, var p2, var image) {
    return Positioned(
      right:
          ((((p1!.x + p2!.x) / 2) - length(p2, p1) * 0.6) - middleX) * rate + x,
      top:
          ((((p1!.y + p2!.y) / 2) - length(p2, p1) * 0.6) - middleY) * rate + y,
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
          width: length(p2, p1) * 1.2 * rate,
          height: length(p2, p1) * 1.2 * rate,
          child: Transform.rotate(
            angle: angle(p1, p2),
            child: Container(
              width: double.infinity,
              child: Image.memory(image),
            ),
          ),
        ),
      ),
    );
  }

  Widget _face(var middleX, var middleY, var p1, var p2, var image) {
    return Positioned(
      right:
          ((((p1!.x + p2!.x) / 2) - length(p2, p1) * 1.4) - middleX) * rate + x,
      top:
          ((((p1!.y + p2!.y) / 2) - length(p2, p1) * 1.4) - middleY) * rate + y,
      child: Container(
        alignment: Alignment.center,
        height: length(p2, p1) * 2.8 * rate,
        child: Transform.rotate(
          angle: angle(p1, p2),
          child: Container(
            height: double.infinity,
            child: image,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Uint8List> images = widget.images;
    List<Pose> poses = widget.poses;
    var face = widget.face;
    var ret;

    if (poses.length == 0) ret = Container();
    for (final pose in poses) {
      double middleX = pose.landmarks[PoseLandmarkType.leftShoulder]!.x +
          pose.landmarks[PoseLandmarkType.rightShoulder]!.x +
          pose.landmarks[PoseLandmarkType.leftHip]!.x +
          pose.landmarks[PoseLandmarkType.rightHip]!.x;
      middleX = middleX / 4;

      double middleY = pose.landmarks[PoseLandmarkType.leftShoulder]!.y +
          pose.landmarks[PoseLandmarkType.rightShoulder]!.y +
          pose.landmarks[PoseLandmarkType.leftHip]!.y +
          pose.landmarks[PoseLandmarkType.rightHip]!.y;
      middleY = middleY / 4;

      ret = RotatedBox(
        quarterTurns: characterTurn,
        child: Container(
          height: 500,
          width: 500,
          child: Transform.scale(
            scale: 1,
            child: Stack(
              children: [
                _body(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.leftShoulder],
                  pose.landmarks[PoseLandmarkType.rightShoulder],
                  pose.landmarks[PoseLandmarkType.leftHip],
                  pose.landmarks[PoseLandmarkType.rightHip],
                  images[0],
                ),
                _leg(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.leftHip],
                  pose.landmarks[PoseLandmarkType.leftKnee],
                  images[5],
                ), //왼쪽 다리 1
                _leg(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.leftKnee],
                  pose.landmarks[PoseLandmarkType.leftAnkle],
                  images[6],
                ), //왼쪽 다리 2
                _leg(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.rightHip],
                  pose.landmarks[PoseLandmarkType.rightKnee],
                  images[7],
                ), //오른쪽 다리 1
                _leg(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.rightKnee],
                  pose.landmarks[PoseLandmarkType.rightAnkle],
                  images[8],
                ), //오른쪽 다리 2
                _arm(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.leftShoulder],
                  pose.landmarks[PoseLandmarkType.leftElbow],
                  images[1],
                ), //왼쪽 팔 1
                _arm(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.rightElbow],
                  pose.landmarks[PoseLandmarkType.rightShoulder],
                  images[3],
                ), //오른쪽 팔 1
                _face(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.rightEyeOuter],
                  pose.landmarks[PoseLandmarkType.leftEyeOuter],
                  face,
                ),
                _arm(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.leftElbow],
                  pose.landmarks[PoseLandmarkType.leftThumb],
                  images[2],
                ), //왼쪽 팔 2
                _arm(
                  middleX,
                  middleY,
                  pose.landmarks[PoseLandmarkType.rightThumb],
                  pose.landmarks[PoseLandmarkType.rightElbow],
                  images[4],
                ), //오른쪽 팔 2
              ],
            ),
          ),
        ),
      );
    }

    return (isPageMovementRunning) ? Container() : ret;
  }
}
