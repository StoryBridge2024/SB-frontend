import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'pose_painter.dart';
import './pose_arrange.dart';
import 'package:camera/camera.dart';
import 'package:frontend/services/mediapipe/movement_follow.dart';
import 'package:frontend/constants/dummy_data.dart';

import 'camera_view.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, width: 100, child: temp());
  }

  Widget temp() {
    if (controller == null) {
      return Container();
    } else
      return CameraPreview(controller!);
  }
}

// 카메라에서 스켈레톤 추출하는 화면
class PoseDetectorView extends StatefulWidget {
  const PoseDetectorView({super.key, required this.images});

  final List<Uint8List> images;

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
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 150,
              width: 150,
              child: CameraView(
                // 스켈레톤 그려주는 객체 전달
                customPaint: _customPaint,
                // 카메라에서 전해주는 이미지 받을 때마다 아래 함수 실행
                onImage: (inputImage) {
                  processImage(inputImage);
                },
              ),
            ),
            Container(
              child: Transform.scale(
                scale: 0.3,
                child: _movementFollow,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 카메라에서 실시간으로 받아온 이미지 처리: 이미지에 포즈가 추출되었으면 스켈레톤 그려주기
  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    // poseDetector에서 추출된 포즈 가져오기
    List<Uint8List> images = widget.images;
    List<Pose> poses = await _poseDetector.processImage(inputImage);

    // 이미지가 정상적이면 포즈에 스켈레톤 그려주기
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = PosePainter(poses, inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter);
      final kindOfPose =
          PoseArrange(poses, count, leftWristXChanges, rightWristXChanges);
      _kindOfPose = kindOfPose.getPose();
      final movementFollow = MovementFollow(poses: poses, images: images);
      _movementFollow = movementFollow;

      print(_kindOfPose);
      print(missions[clr_index.value]);
      print(clr_index.value);
      if (_kindOfPose == missions[clr_index.value]) {
        print("wowowowowow");
        clr_index.value++;
      }
    } else {
      // 추출된 포즈 없음
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
