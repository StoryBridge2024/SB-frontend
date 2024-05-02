import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'dart:math';

class MovementFollow extends StatefulWidget {
  const MovementFollow({super.key, required this.poses});

  final List<Pose> poses;

  @override
  State<MovementFollow> createState() => _MovementFollowState();
}

class _MovementFollowState extends State<MovementFollow> {
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

  Widget boxbox(var p1, var p2, String image) {
    return Positioned(
      right: ((p1!.x + p2!.x) / 2) * (340 / 720) -
          length(p1, p2) / 2, //화면 비율에 따른 크기로 변환하는 과정 필요
      top: ((p1!.y + p2!.y) / 2) * (600 / 1280) - length(p1, p2) / 2,
      child: Transform.rotate(
        angle: angle(p1, p2),
        child: Image.asset(
          image,
          width: length(p1, p2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Pose> poses = widget.poses;
    var ret;

    for (final pose in poses) {
      //print(pose.landmarks[PoseLandmarkType.leftWrist]?.y ?? 0);

      ret = Stack(
        children: [
          boxbox(pose.landmarks[PoseLandmarkType.leftWrist],
              pose.landmarks[PoseLandmarkType.leftElbow], "assets/charater/larm.png"),
          boxbox(pose.landmarks[PoseLandmarkType.leftElbow],
              pose.landmarks[PoseLandmarkType.leftShoulder], "assets/charater/larm.png"),
          boxbox(pose.landmarks[PoseLandmarkType.rightWrist],
              pose.landmarks[PoseLandmarkType.rightElbow], "assets/charater/rarm.png"),
          boxbox(
              pose.landmarks[PoseLandmarkType.rightElbow],
              pose.landmarks[PoseLandmarkType.rightShoulder],
              "assets/charater/rarm.png"),
          boxbox(pose.landmarks[PoseLandmarkType.rightEar],
              pose.landmarks[PoseLandmarkType.leftEar], "assets/charater/face.jpg")
        ],
      );
    }
    return Container(
      child: ret,
      height: 600,
      width: 340,
    );
  }
}
