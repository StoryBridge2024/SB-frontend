import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'dart:math';

class MovementFollow extends StatefulWidget {
  const MovementFollow({super.key, required this.poses, required this.images});

  final List<Uint8List> images;
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

  Widget boxbox(var p1, var p2, Uint8List image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p1, p2) / 2) *
          (500 / 720), //화면 비율에 따른 크기로 변환하는 과정 필요
      top: (((p1!.y + p2!.y) / 2) - length(p1, p2) / 2) * (500 / 1280),
      child: Transform.rotate(
        angle: angle(p1, p2),
        child: Image.memory(
          image,
          width: length(p1, p2),
        ),
      ),
    );
  }

  Widget boxbox2(var p1, var p2, String image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p1, p2) / 2) *
          (500 / 720), //화면 비율에 따른 크기로 변환하는 과정 필요
      top: (((p1!.y + p2!.y) / 2) - length(p1, p2) / 2) * (500 / 1280),
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
    List<Uint8List> images = widget.images;
    List<Pose> poses = widget.poses;
    var ret;

    for (final pose in poses) {
      ret = Stack(
        children: [
          boxbox(pose.landmarks[PoseLandmarkType.leftWrist],
              pose.landmarks[PoseLandmarkType.leftWrist], images[2]),
          boxbox(pose.landmarks[PoseLandmarkType.leftWrist],
              pose.landmarks[PoseLandmarkType.leftElbow], images[2]),
          boxbox(pose.landmarks[PoseLandmarkType.leftElbow],
              pose.landmarks[PoseLandmarkType.leftShoulder], images[1]),
          boxbox(pose.landmarks[PoseLandmarkType.rightWrist],
              pose.landmarks[PoseLandmarkType.rightElbow], images[4]),
          boxbox(pose.landmarks[PoseLandmarkType.rightElbow],
              pose.landmarks[PoseLandmarkType.rightShoulder], images[3]),
          boxbox(pose.landmarks[PoseLandmarkType.rightEar],
              pose.landmarks[PoseLandmarkType.leftEar], images[0]),
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
