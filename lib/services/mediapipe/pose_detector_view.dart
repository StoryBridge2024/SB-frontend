import 'dart:async';
import 'dart:typed_data';
import 'package:frontend/constants/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import './pose_arrange.dart';
import './movement_follow.dart';
import 'camera_view.dart';
import 'package:frontend/pages/makingFairytale.dart';
import 'package:frontend/constants/action_list.dart';

// 카메라에서 스켈레톤 추출하는 화면
class PoseDetectorView extends StatefulWidget {
  PoseDetectorView({super.key, required this.images, required this.face});

  List<Uint8List> images;
  final Widget face;

  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  // 스켈레톤 추출 변수 선언(google_mlkit_pose_detection 라이브러리)
  final PoseDetector _poseDetector =
      PoseDetector(options: PoseDetectorOptions());
  bool _canProcess = true;
  bool _isBusy = false;

  // 스켈레톤 모양을 그려주는 변수
  CustomPaint? _customPaint;

  String _kindOfPose = "";
  var _movementFollow;

  //동작 개수만큼 리스트 요소 개수 정하면 됨.
  List<int> count = List.filled(11, 0);
  List<double> leftWristXChanges = [];
  List<double> rightWristXChanges = [];

  // input Map
  Map<String, double> inputMap = {};

  @override
  void dispose() async {
    _canProcess = false;
    _poseDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 카메라뷰 보이기
    return Stack(
      children: [
        Container(
          height: 500,
          width: 500,
          child: CameraView(
            // 스켈레톤 그려주는 객체 전달
            customPaint: _customPaint,
            // 카메라에서 전해주는 이미지 받을 때마다 아래 함수 실행
            onImage: (inputImage) {
              processImage(inputImage);
            },
          ),
        ),
        Positioned(
          left: locX1.elementAt(clr_index.value)-150,
          top: locY1.elementAt(clr_index.value)-200,
          child: Container(
            width: 500,
            child: RotatedBox(
              quarterTurns: 3,
              child: Transform.scale(
                scale: 0.5,
                child: Container(
                alignment: Alignment.center,
                width: 500,
                height: 1000,
                color: Colors.amberAccent,
                child: _movementFollow,
                ),
                ),),
          ),

          ),

      ],
    );
  }

  // 카메라에서 실시간으로 받아온 이미지 처리: 이미지에 포즈가 추출되었으면 스켈레톤 그려주기
  Future<void> processImage(InputImage inputImage) async {
    var images = widget.images;
    var face = widget.face;

    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    // poseDetector에서 추출된 포즈 가져오기
    List<Pose> poses = await _poseDetector.processImage(inputImage);

    // 이미지가 정상적이면 포즈에 스켈레톤 그려주기
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final kindOfPose =
          PoseArrange(poses, count, leftWristXChanges, rightWristXChanges);
      _kindOfPose = kindOfPose.getPose();
      final movementFollow =
          MovementFollow(poses: poses, images: images, face: face);
      _movementFollow = movementFollow;

      // print(_kindOfPose);
      // print(gSceneModel!
      //     .scriptModelList[clr_index.value].actions_used_in_action_list[0]);
      //print(missions[clr_index.value]);
      print(clr_index.value);

      if (_kindOfPose ==
              gSceneModel!.scriptModelList[clr_index.value]
                  .actions_used_in_action_list[0] &&
          clr_index.value < 3) {
        clr_index.value++;
      }
      // if (_kindOfPose == missions[clr_index.value]) {
      //   clr_index.value++;
      // }
    } else {
      // 추출된 포즈 없음
      _customPaint = null;
      _movementFollow = Container();
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
