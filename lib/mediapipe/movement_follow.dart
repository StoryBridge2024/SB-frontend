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
      top: (((p1!.y + p2!.y) / 2) - length(p1, p2) / 2) * 0.29,
      child: Transform.rotate(
        angle: angle(p1, p2),
        child: Image.memory(
          image,
          width: length(p1, p2) * 0.3,
        ),
      ),
    );
  }

  Widget leg(var p1, var p2, Uint8List image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p2, p1) / 2) * 0.25,
      top: (((p1!.y + p2!.y) / 2) - lengthX(p2, p1)) * 0.25,
      child: Transform.rotate(
        angle: angle(p1, p2) + 3.141592653579 * 0.5,
        child: Image.memory(
          image,
          width: lengthX(p1, p2) * 0.3,
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
        child: Image.memory(
          image,
          width: length(p1, p2) * 0.3,
        ),
      ),
    );
  }

  Widget face(var p1, var p2, String image) {
    return Positioned(
      right: (((p1!.x + p2!.x) / 2) - length(p1, p2) / 2) * 0.23,
      top: (((p1!.y + p2!.y) / 2) - length(p1, p2) / 2) * 0.23,
      child: Transform.rotate(
        angle: angle(p1, p2),
        child: Image.asset(
          image,
          width: length(p1, p2) * 0.5,
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
      ret = Container(
        color: Colors.red,
        height: 2000,
        width: 2000,
        child: Transform.scale(
          scale: 2,
          child: Stack(
            children: [
              body(
                pose.landmarks[PoseLandmarkType.rightShoulder],
                pose.landmarks[PoseLandmarkType.leftShoulder],
                pose.landmarks[PoseLandmarkType.rightHip],
                pose.landmarks[PoseLandmarkType.leftHip],
                images[0],
              ), //머리
              arm(
                pose.landmarks[PoseLandmarkType.leftShoulder],
                pose.landmarks[PoseLandmarkType.leftElbow],
                images[1],
              ), //왼쪽 팔 1
              arm(
                pose.landmarks[PoseLandmarkType.leftElbow],
                pose.landmarks[PoseLandmarkType.leftThumb],
                images[2],
              ), //왼쪽 팔 2
              arm(
                pose.landmarks[PoseLandmarkType.rightElbow],
                pose.landmarks[PoseLandmarkType.rightShoulder],
                images[3],
              ), //오른쪽 팔 1
              arm(
                pose.landmarks[PoseLandmarkType.rightThumb],
                pose.landmarks[PoseLandmarkType.rightElbow],
                images[4],
              ), //오른쪽 팔 1
              leg(
                pose.landmarks[PoseLandmarkType.leftHip],
                pose.landmarks[PoseLandmarkType.leftKnee],
                images[5],
              ), //왼쪽 다리 1
              leg(
                pose.landmarks[PoseLandmarkType.leftKnee],
                pose.landmarks[PoseLandmarkType.leftAnkle],
                images[6],
              ), //왼쪽 다리 2
              leg(
                pose.landmarks[PoseLandmarkType.rightHip],
                pose.landmarks[PoseLandmarkType.rightKnee],
                images[7],
              ), //오른쪽 다리 1
              leg(
                pose.landmarks[PoseLandmarkType.rightKnee],
                pose.landmarks[PoseLandmarkType.rightAnkle],
                images[8],
              ), //오른쪽 다리 2
              face(
                pose.landmarks[PoseLandmarkType.rightEar],
                pose.landmarks[PoseLandmarkType.leftEar],
                "assets/character/face.jpg",
              )
            ],
          ),
        ),
      );
    }
    return ret;
  }
}
