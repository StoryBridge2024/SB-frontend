import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'dart:async';

class PoseArrange extends Object {
  PoseArrange(
      this.poses, this.count, this.leftWristXChanges, this.rightWristXChanges);

  final List<Pose> poses;
  List<int> count;
  List<double> leftWristXChanges;
  List<double> rightWristXChanges;
  int frameIdx = 0;

  void updatePositionChangeList(List<double> list, double newPosition) {
    if (list.length > 10) list.removeAt(0);
    list.add(newPosition);
  }

  bool detectWaving(List<double> changes) {
    if (changes.length < 10) return false;
    double max =
        changes.reduce((value, element) => value > element ? value : element);
    double min =
        changes.reduce((value, element) => value < element ? value : element);
    return max - min > 50; // Waving threshold: change of 50 pixels
  }

  String updatePoseCount(
      List<int> count, int index, String newPose, String currentPose) {
    count[index]++;
    if (count[index] > 30) {
      count[index] = 0;
      currentPose = newPose;
    }
    return currentPose;
  }

  String getPose() {
    String kindOfPose = "";

    for (final pose in poses) {
      // print(ppp[0]); // Debugging line, consider removing or replacing with a logger if needed
      //frameIdx += 1;

      final leftWristY = pose.landmarks[PoseLandmarkType.leftWrist]?.y ?? 0;
      final rightWristY = pose.landmarks[PoseLandmarkType.rightWrist]?.y ?? 0;
      final leftWristX = pose.landmarks[PoseLandmarkType.leftWrist]?.x ?? 0;
      final rightWristX = pose.landmarks[PoseLandmarkType.rightWrist]?.x ?? 0;
      final noseY = pose.landmarks[PoseLandmarkType.nose]?.y ?? 0;
      final leftShoulderY =
          pose.landmarks[PoseLandmarkType.leftShoulder]?.y ?? 0;
      final rightShoulderY =
          pose.landmarks[PoseLandmarkType.rightShoulder]?.y ?? 0;
      final leftShoulderX =
          pose.landmarks[PoseLandmarkType.leftShoulder]?.x ?? 0;
      final rightShoulderX =
          pose.landmarks[PoseLandmarkType.rightShoulder]?.x ?? 0;
      final leftElbowY = pose.landmarks[PoseLandmarkType.leftElbow]?.y ?? 0;
      final rightElbowY = pose.landmarks[PoseLandmarkType.rightElbow]?.y ?? 0;
      final leftElbowX = pose.landmarks[PoseLandmarkType.leftElbow]?.x ?? 0;
      final rightElbowX = pose.landmarks[PoseLandmarkType.rightElbow]?.x ?? 0;
      final leftHipY = pose.landmarks[PoseLandmarkType.leftHip]?.y ?? 0;
      final rightHipY = pose.landmarks[PoseLandmarkType.rightHip]?.y ?? 0;
      final leftHipX = pose.landmarks[PoseLandmarkType.leftHip]?.x ?? 0;
      final rightHipX = pose.landmarks[PoseLandmarkType.rightHip]?.x ?? 0;
      final leftIndexFingerTipX =
          pose.landmarks[PoseLandmarkType.leftIndex]?.x ?? 0;
      final leftIndexFingerTipY =
          pose.landmarks[PoseLandmarkType.leftIndex]?.y ?? 0;
      final rightIndexFingerTipX =
          pose.landmarks[PoseLandmarkType.rightIndex]?.x ?? 0;
      final rightIndexFingerTipY =
          pose.landmarks[PoseLandmarkType.rightIndex]?.y ?? 0;

      final leftPalmCenterX = (leftWristX + leftIndexFingerTipX) / 2;
      final leftPalmCenterY = (leftWristY + leftIndexFingerTipY) / 2;
      final rightPalmCenterX = (rightWristX + rightIndexFingerTipX) / 2;
      final rightPalmCenterY = (rightWristY + rightIndexFingerTipY) / 2;

      updatePositionChangeList(leftWristXChanges, leftWristX);
      updatePositionChangeList(rightWristXChanges, rightWristX);

      if (detectWaving(leftWristXChanges)) {
        kindOfPose = updatePoseCount(count, 6, "왼손 흔들기", kindOfPose);
        leftWristXChanges.clear();
      }
      if (detectWaving(rightWristXChanges)) {
        kindOfPose = updatePoseCount(count, 7, "오른손 흔들기", kindOfPose);
        rightWristXChanges.clear();
      }
      // Detecting left hand up
      if (leftWristY < leftElbowY && leftElbowY < leftShoulderY) {
        kindOfPose = updatePoseCount(count, 0, "왼손 번쩍", kindOfPose);
      }
      // Detecting right hand up
      if (rightWristY < rightElbowY && rightElbowY < rightShoulderY) {
        kindOfPose = updatePoseCount(count, 1, "오른손 번쩍", kindOfPose);
      }
      // Both hands up
      if (leftWristY < leftShoulderY && rightWristY < rightShoulderY) {
        kindOfPose = updatePoseCount(count, 2, "양손 번쩍", kindOfPose);
      }
      // Clapping
      if ((leftIndexFingerTipX - rightIndexFingerTipX).abs() < 100 &&
          (leftIndexFingerTipY - rightIndexFingerTipY).abs() < 100) {
        kindOfPose = updatePoseCount(count, 3, "박수 치기", kindOfPose);
      }
      // Head down
      if (noseY > leftShoulderY && noseY > rightShoulderY) {
        kindOfPose = updatePoseCount(count, 4, "고개 숙이기", kindOfPose);
      }
      // Bending waist
      if (leftHipY - leftShoulderY < 100 && rightHipY - rightShoulderY < 100) {
        kindOfPose = updatePoseCount(count, 5, "허리 숙이기", kindOfPose);
      }
      // Arms Crossed
      if ((leftWristX > rightShoulderX && rightWristX < leftShoulderX) &&
          (leftWristY > leftHipY && rightWristY > rightHipY)) {
        kindOfPose = updatePoseCount(count, 8, "팔짱 끼기", kindOfPose);
      }
      // Attention (차렷하기)
      if (leftWristX > leftHipX &&
          rightWristX < rightHipX &&
          (leftWristY - leftHipY).abs() < 50 &&
          (rightWristY - rightHipY).abs() < 50) {
        kindOfPose = updatePoseCount(count, 9, "차렷하기", kindOfPose);
      }
      // Hands on Hips
      if (((leftWristX - leftHipX).abs() < 100 &&
              (rightWristX - rightHipX).abs() < 100) &&
          (leftWristY > leftHipY && rightWristY > rightHipY) &&
          (leftWristY < leftShoulderY && rightWristY < rightShoulderY)) {
        kindOfPose = updatePoseCount(count, 10, "손 허리에", kindOfPose);
      }

      // Jumping (Hip height increase as a simple check)
      //if (leftHipY > 200 && rightHipY > 200) {  // Assuming initial standing hip height is less than 200 pixels
      //  kindOfPose = updatePoseCount(count, 11, "점프", kindOfPose);
      //}
      // Waving hand
      // if (detectWaving(leftWristXChanges) || detectWaving(rightWristXChanges)) {
      //   updatePoseCount(count, 7, "손 흔들기", kindOfPose);
      //   leftWristXChanges.clear();
      //   rightWristXChanges.clear();
      // }
    }
    return kindOfPose;
  }
}
