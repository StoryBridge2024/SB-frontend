import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class PoseArrange extends Object {
  PoseArrange(
      this.poses, this.count, this.leftWristXChanges, this.rightWristXChanges);

  final List<Pose> poses;
  List<int> count;
  List<double> leftWristXChanges;
  List<double> rightWristXChanges;
  int frameIdx = 0;

  void updatePositionChangeList(List<double> list, double newPosition) {
    if (list.length > 15) list.removeAt(0);
    list.add(newPosition);
  }

  bool detectWaving(List<double> changes) {
    if (changes.length < 15) return false;
    double max =
        changes.reduce((value, element) => value > element ? value : element);
    double min =
        changes.reduce((value, element) => value < element ? value : element);
    return max - min > 20; // Waving threshold: change of 50 pixels
  }

  String updatePoseCount(
      List<int> count, int index, String newPose, String currentPose) {
    count[index]++;
    if (index == 6 || index == 7) {
      if (count[index] > 5) {
        count[index] = 0;
        currentPose = newPose;
      }
    } else if (count[index] > 20) {
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

      var leftWristY = 0.0;
      var rightWristY = 0.0;
      var leftWristX = 0.0;
      var rightWristX = 0.0;
      var noseY = 0.0;
      var leftShoulderY = 0.0;
      var rightShoulderY = 0.0;
      var leftShoulderX = 0.0;
      var rightShoulderX = 0.0;
      var leftElbowY = 0.0;
      var rightElbowY = 0.0;
      var leftElbowX = 0.0;
      var rightElbowX = 0.0;
      var leftHipY = 0.0;
      var rightHipY = 0.0;
      var leftHipX = 0.0;
      var rightHipX = 0.0;
      var leftIndexFingerTipX = 0.0;
      var leftIndexFingerTipY = 0.0;
      var rightIndexFingerTipX = 0.0;
      var rightIndexFingerTipY = 0.0;

      var leftPalmCenterX = 0.0;
      var leftPalmCenterY = 0.0;
      var rightPalmCenterX = 0.0;
      var rightPalmCenterY = 0.0;

      if (characterTurn == 0) {
        //카메라 안 돌아간 상태
        leftWristY = pose.landmarks[PoseLandmarkType.leftWrist]?.y ?? 0;
        rightWristY = pose.landmarks[PoseLandmarkType.rightWrist]?.y ?? 0;
        leftWristX = pose.landmarks[PoseLandmarkType.leftWrist]?.x ?? 0;
        rightWristX = pose.landmarks[PoseLandmarkType.rightWrist]?.x ?? 0;
        noseY = pose.landmarks[PoseLandmarkType.nose]?.y ?? 0;
        leftShoulderY = pose.landmarks[PoseLandmarkType.leftShoulder]?.y ?? 0;
        rightShoulderY = pose.landmarks[PoseLandmarkType.rightShoulder]?.y ?? 0;
        leftShoulderX = pose.landmarks[PoseLandmarkType.leftShoulder]?.x ?? 0;
        rightShoulderX = pose.landmarks[PoseLandmarkType.rightShoulder]?.x ?? 0;
        leftElbowY = pose.landmarks[PoseLandmarkType.leftElbow]?.y ?? 0;
        rightElbowY = pose.landmarks[PoseLandmarkType.rightElbow]?.y ?? 0;
        leftElbowX = pose.landmarks[PoseLandmarkType.leftElbow]?.x ?? 0;
        rightElbowX = pose.landmarks[PoseLandmarkType.rightElbow]?.x ?? 0;
        leftHipY = pose.landmarks[PoseLandmarkType.leftHip]?.y ?? 0;
        rightHipY = pose.landmarks[PoseLandmarkType.rightHip]?.y ?? 0;
        leftHipX = pose.landmarks[PoseLandmarkType.leftHip]?.x ?? 0;
        rightHipX = pose.landmarks[PoseLandmarkType.rightHip]?.x ?? 0;
        leftIndexFingerTipX =
            pose.landmarks[PoseLandmarkType.leftIndex]?.x ?? 0;
        leftIndexFingerTipY =
            pose.landmarks[PoseLandmarkType.leftIndex]?.y ?? 0;
        rightIndexFingerTipX =
            pose.landmarks[PoseLandmarkType.rightIndex]?.x ?? 0;
        rightIndexFingerTipY =
            pose.landmarks[PoseLandmarkType.rightIndex]?.y ?? 0;
      } else if (characterTurn == 1) {
        //카메라 반시계로 돌아간 상태
        leftWristY = (pose.landmarks[PoseLandmarkType.leftWrist]?.x ?? 0) * -1;
        rightWristY =
            (pose.landmarks[PoseLandmarkType.rightWrist]?.x ?? 0) * -1;
        leftWristX = pose.landmarks[PoseLandmarkType.leftWrist]?.y ?? 0;
        rightWristX = pose.landmarks[PoseLandmarkType.rightWrist]?.y ?? 0;
        noseY = (pose.landmarks[PoseLandmarkType.nose]?.x ?? 0) * -1;
        leftShoulderY =
            (pose.landmarks[PoseLandmarkType.leftShoulder]?.x ?? 0) * -1;
        rightShoulderY =
            (pose.landmarks[PoseLandmarkType.rightShoulder]?.x ?? 0) * -1;
        leftShoulderX = pose.landmarks[PoseLandmarkType.leftShoulder]?.y ?? 0;
        rightShoulderX = pose.landmarks[PoseLandmarkType.rightShoulder]?.y ?? 0;
        leftElbowY = (pose.landmarks[PoseLandmarkType.leftElbow]?.x ?? 0) * -1;
        rightElbowY =
            (pose.landmarks[PoseLandmarkType.rightElbow]?.x ?? 0) * -1;
        leftElbowX = pose.landmarks[PoseLandmarkType.leftElbow]?.y ?? 0;
        rightElbowX = pose.landmarks[PoseLandmarkType.rightElbow]?.y ?? 0;
        leftHipY = (pose.landmarks[PoseLandmarkType.leftHip]?.x ?? 0) * -1;
        rightHipY = (pose.landmarks[PoseLandmarkType.rightHip]?.x ?? 0) * -1;
        leftHipX = pose.landmarks[PoseLandmarkType.leftHip]?.y ?? 0;
        rightHipX = pose.landmarks[PoseLandmarkType.rightHip]?.y ?? 0;
        leftIndexFingerTipX =
            pose.landmarks[PoseLandmarkType.leftIndex]?.y ?? 0;
        leftIndexFingerTipY =
            (pose.landmarks[PoseLandmarkType.leftIndex]?.x ?? 0) * -1;
        rightIndexFingerTipX =
            pose.landmarks[PoseLandmarkType.rightIndex]?.y ?? 0;
        rightIndexFingerTipY =
            (pose.landmarks[PoseLandmarkType.rightIndex]?.x ?? 0) * -1;
      } else if (characterTurn == 2) {
        //카메라 180도 돌아간 상태
        leftWristY = (pose.landmarks[PoseLandmarkType.leftWrist]?.y ?? 0) * -1;
        rightWristY =
            (pose.landmarks[PoseLandmarkType.rightWrist]?.y ?? 0) * -1;
        leftWristX = (pose.landmarks[PoseLandmarkType.leftWrist]?.x ?? 0) * -1;
        rightWristX =
            (pose.landmarks[PoseLandmarkType.rightWrist]?.x ?? 0) * -1;
        noseY = (pose.landmarks[PoseLandmarkType.nose]?.y ?? 0) * -1;
        leftShoulderY =
            (pose.landmarks[PoseLandmarkType.leftShoulder]?.y ?? 0) * -1;
        rightShoulderY =
            (pose.landmarks[PoseLandmarkType.rightShoulder]?.y ?? 0) * -1;
        leftShoulderX =
            (pose.landmarks[PoseLandmarkType.leftShoulder]?.x ?? 0) * -1;
        rightShoulderX =
            (pose.landmarks[PoseLandmarkType.rightShoulder]?.x ?? 0) * -1;
        leftElbowY = (pose.landmarks[PoseLandmarkType.leftElbow]?.y ?? 0) * -1;
        rightElbowY =
            (pose.landmarks[PoseLandmarkType.rightElbow]?.y ?? 0) * -1;
        leftElbowX = (pose.landmarks[PoseLandmarkType.leftElbow]?.x ?? 0) * -1;
        rightElbowX =
            (pose.landmarks[PoseLandmarkType.rightElbow]?.x ?? 0) * -1;
        leftHipY = (pose.landmarks[PoseLandmarkType.leftHip]?.y ?? 0) * -1;
        rightHipY = (pose.landmarks[PoseLandmarkType.rightHip]?.y ?? 0) * -1;
        leftHipX = (pose.landmarks[PoseLandmarkType.leftHip]?.x ?? 0) * -1;
        rightHipX = (pose.landmarks[PoseLandmarkType.rightHip]?.x ?? 0) * -1;
        leftIndexFingerTipX =
            (pose.landmarks[PoseLandmarkType.leftIndex]?.x ?? 0) * -1;
        leftIndexFingerTipY =
            (pose.landmarks[PoseLandmarkType.leftIndex]?.y ?? 0) * -1;
        rightIndexFingerTipX =
            (pose.landmarks[PoseLandmarkType.rightIndex]?.x ?? 0) * -1;
        rightIndexFingerTipY =
            (pose.landmarks[PoseLandmarkType.rightIndex]?.y ?? 0) * -1;
      } else if (characterTurn == 3) {
        //시계 방향으로 90도 돌아간 상태
        leftWristY = (pose.landmarks[PoseLandmarkType.leftWrist]?.x ?? 0);
        rightWristY = (pose.landmarks[PoseLandmarkType.rightWrist]?.x ?? 0);
        leftWristX = (pose.landmarks[PoseLandmarkType.leftWrist]?.y ?? 0) * -1;
        rightWristX =
            (pose.landmarks[PoseLandmarkType.rightWrist]?.y ?? 0) * -1;
        noseY = (pose.landmarks[PoseLandmarkType.nose]?.x ?? 0);
        leftShoulderY = (pose.landmarks[PoseLandmarkType.leftShoulder]?.x ?? 0);
        rightShoulderY =
            (pose.landmarks[PoseLandmarkType.rightShoulder]?.x ?? 0);
        leftShoulderX =
            (pose.landmarks[PoseLandmarkType.leftShoulder]?.y ?? 0) * -1;
        rightShoulderX =
            (pose.landmarks[PoseLandmarkType.rightShoulder]?.y ?? 0 * -1);
        leftElbowY = (pose.landmarks[PoseLandmarkType.leftElbow]?.x ?? 0);
        rightElbowY = (pose.landmarks[PoseLandmarkType.rightElbow]?.x ?? 0);
        leftElbowX = (pose.landmarks[PoseLandmarkType.leftElbow]?.y ?? 0) * -1;
        rightElbowX =
            (pose.landmarks[PoseLandmarkType.rightElbow]?.y ?? 0) * -1;
        leftHipY = (pose.landmarks[PoseLandmarkType.leftHip]?.x ?? 0);
        rightHipY = (pose.landmarks[PoseLandmarkType.rightHip]?.x ?? 0);
        leftHipX = (pose.landmarks[PoseLandmarkType.leftHip]?.y ?? 0) * -1;
        rightHipX = (pose.landmarks[PoseLandmarkType.rightHip]?.y ?? 0) * -1;
        leftIndexFingerTipX =
            (pose.landmarks[PoseLandmarkType.leftIndex]?.y ?? 0) * -1;
        leftIndexFingerTipY =
            (pose.landmarks[PoseLandmarkType.leftIndex]?.x ?? 0);
        rightIndexFingerTipX =
            (pose.landmarks[PoseLandmarkType.rightIndex]?.y ?? 0) * -1;
        rightIndexFingerTipY =
            (pose.landmarks[PoseLandmarkType.rightIndex]?.x ?? 0);
      }

      leftPalmCenterX = (leftWristX + leftIndexFingerTipX) / 2;
      leftPalmCenterY = (leftWristY + leftIndexFingerTipY) / 2;
      rightPalmCenterX = (rightWristX + rightIndexFingerTipX) / 2;
      rightPalmCenterY = (rightWristY + rightIndexFingerTipY) / 2;

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
