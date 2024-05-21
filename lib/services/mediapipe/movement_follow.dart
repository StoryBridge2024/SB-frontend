import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'dart:math';
import 'package:frontend/constants/dummy_data.dart';

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

  Widget arm(var p1, var p2, Uint8List image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p1, p2) / 2) * 0.25,
      top: (((p1!.y + p2!.y) / 2) - length(p1, p2) / 2) * 0.25,
      child: Transform.rotate(
        angle: angle(p1, p2),
        child: Container(
          width: 100,
          height: 100,
          child: Image.memory(
            image,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget leg(var p1, var p2, Uint8List image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p2, p1) / 2) * 0.25,
      top: (((p1!.y + p2!.y) / 2) - length(p2, p1) / 2) * 0.25,
      child: Transform.rotate(
        angle: angle(p1, p2) + 3.141592653579 * 0.5,
        child: Container(
          width: 100,
          height: 100,
          child: Image.memory(
            image,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget body(var p1, var p2, var p3, var p4, Uint8List image) {
    return Positioned(
      right:
          (((p1!.x + p2!.x + p3!.x + p4!.x) / 4) - length(p1, p2) / 2) * 0.25,
      top: (((p1!.y + p2!.y + p3!.y + p4!.y) / 4) - length(p2, p3) / 2) * 0.25,
      child: Transform.rotate(
        angle: angle(p1, p2),
        child: Container(
          width: 150,
          height: 150,
          child: Image.memory(
            image,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget head(var p1, var p2, Widget image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p1, p2) / 2) * 0.23,
      top: (((p1!.y + p2!.y) / 2) - length(p1, p2) / 2) * 0.23,
      child: Transform.rotate(
        angle: angle(p1, p2),
        child: Container(
          child: image,
          width: length(p1, p2) * 0.5,
        ),
      ),
    );
  }

  Widget temp(var p1, var p2, var image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p2, p1) * 0.6) + 300,
      top: (((p1!.y + p2!.y) / 2) - length(p2, p1) * 0.6) + 50,
      child: Container(
        width: length(p2, p1) * 1.2,
        height: length(p2, p1) * 1.2,
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

  Widget tempBody(var p1, var p2, var p3, var p4, var image) {
    return Positioned(
      right:
          (((p1!.x + p2!.x + p3!.x + p4!.x) / 4) - length(p4, p1) * 0.5) + 300,
      top: (((p1!.y + p2!.y + p3!.y + p4!.y) / 4) - length(p4, p1) * 0.5) + 50,
      child: Container(
        width: length(p4, p1) * 1,
        height: length(p4, p1) * 1,
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

  Widget tempFace(var p1, var p2, var image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p2, p1) * 1.25) + 300,
      top: (((p1!.y + p2!.y) / 2) - length(p2, p1) * 1.25) + 50,
      child: Container(
        width: length(p2, p1) * 2.5,
        height: length(p2, p1) * 2.5,
        child: Transform.rotate(
          angle: angle(p1, p2),
          child: Container(
            width: double.infinity,
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
      ret = RotatedBox(
        quarterTurns: turn,
        child: Container(
          height: 500,
          width: 500,
          child: Transform.scale(
            scale: 1,
            child: Stack(
              children: [
                tempBody(
                  pose.landmarks[PoseLandmarkType.leftShoulder],
                  pose.landmarks[PoseLandmarkType.rightShoulder],
                  pose.landmarks[PoseLandmarkType.leftHip],
                  pose.landmarks[PoseLandmarkType.rightHip],
                  images[0],
                ),
                // temp(
                //   pose.landmarks[PoseLandmarkType.leftHip],
                //   pose.landmarks[PoseLandmarkType.leftKnee],
                //   "assets/character/real.png",
                // ), //왼쪽 다리 1
                // temp(
                //   pose.landmarks[PoseLandmarkType.leftKnee],
                //   pose.landmarks[PoseLandmarkType.leftAnkle],
                //   "assets/character/real.png",
                // ), //왼쪽 다리 2
                // temp(
                //   pose.landmarks[PoseLandmarkType.rightHip],
                //   pose.landmarks[PoseLandmarkType.rightKnee],
                //   "assets/character/real.png",
                // ), //오른쪽 다리 1
                // temp(
                //   pose.landmarks[PoseLandmarkType.rightKnee],
                //   pose.landmarks[PoseLandmarkType.rightAnkle],
                //   "assets/character/real.png",
                // ), //오른쪽 다리 2
                temp(
                  pose.landmarks[PoseLandmarkType.leftShoulder],
                  pose.landmarks[PoseLandmarkType.leftElbow],
                  images[1],
                ), //왼쪽 팔 1
                temp(
                  pose.landmarks[PoseLandmarkType.leftElbow],
                  pose.landmarks[PoseLandmarkType.leftThumb],
                  images[2],
                ), //왼쪽 팔 2
                temp(
                  pose.landmarks[PoseLandmarkType.rightElbow],
                  pose.landmarks[PoseLandmarkType.rightShoulder],
                  images[3],
                ), //오른쪽 팔 1
                temp(
                  pose.landmarks[PoseLandmarkType.rightThumb],
                  pose.landmarks[PoseLandmarkType.rightElbow],
                  images[4],
                ), //오른쪽 팔 1
                tempFace(
                  pose.landmarks[PoseLandmarkType.rightEar],
                  pose.landmarks[PoseLandmarkType.leftEar],
                  face,
                )
              ],
            ),
          ),
        ),
      );
    }

    return ret;
  }
}
