import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import 'coordinates_translator.dart';

// 스켈레톤을 화면에 그려주는 클래스(추출된 포즈의 관절 랜드마크 배열, 이미지 크기, 이미지 회전 정보)
// translateX, translateY를 사용해 추출된 좌표를 휴대폰 화면 크기에 맞게 변형하여 그려줌
class PosePainter extends CustomPainter {
  PosePainter(this.poses, this.absoluteImageSize, this.rotation);

  // 추출된 포즈의 랜드마크 리스트
  final List<Pose> poses;

  // 이미지 크기
  final Size absoluteImageSize;

  // 이미지 회전 정보
  final InputImageRotation rotation;

  @override
  void paint(Canvas canvas, Size size) {
    // 초록: 33개의 관절 포인트(랜드마크) 색깔
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.green;

    // 노랑: 선 색깔
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.yellow;

    // 추출된 관절 포인트 갯수만큼 점 그리기
    for (final pose in poses) {
      pose.landmarks.forEach((_, landmark) {
        canvas.drawCircle(
            Offset(
              translateX(landmark.x, rotation, size, absoluteImageSize),
              translateY(landmark.y, rotation, size, absoluteImageSize),
            ),
            1,
            paint);
      });

      // 점1과 점2를 선으로 이어주는 함수(랜드마크 타입1, 랜드마크 타입2, 선 색깔 타입)
      void paintLine(
          PoseLandmarkType type1, PoseLandmarkType type2, Paint paintType) {
        final PoseLandmark joint1 = pose.landmarks[type1]!;
        final PoseLandmark joint2 = pose.landmarks[type2]!;
        canvas.drawLine(
            Offset(translateX(joint1.x, rotation, size, absoluteImageSize),
                translateY(joint1.y, rotation, size, absoluteImageSize)),
            Offset(translateX(joint2.x, rotation, size, absoluteImageSize),
                translateY(joint2.y, rotation, size, absoluteImageSize)),
            paintType);
      }

      //Draw arms
      paintLine(
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow, linePaint);
      paintLine(
          PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist, linePaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow,
          linePaint);
      paintLine(
          PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist, linePaint);

      //Draw Body
      paintLine(
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip, linePaint);
      paintLine(
          PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip, linePaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.leftShoulder,
          linePaint);
      paintLine(PoseLandmarkType.rightHip, PoseLandmarkType.leftHip, linePaint);

      //Draw legs
      paintLine(PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee, linePaint);
      paintLine(
          PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle, linePaint);
      paintLine(
          PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee, linePaint);
      paintLine(
          PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.poses != poses;
  }
}
