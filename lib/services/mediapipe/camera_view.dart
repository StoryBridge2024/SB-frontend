import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/dummy_data.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

import 'package:frontend/main.dart';
import 'package:frontend/constants/fairytaleConstants.dart';
import '../../constants/fairytaleConstants.dart';

ValueNotifier<CameraController?> controller = ValueNotifier(null);

// 카메라 화면
class CameraView extends StatefulWidget {
  const CameraView(
      {Key? key,
      required this.onImage,
      this.initialDirection = CameraLensDirection.front})
      : super(key: key);

  // 이미지 받을 때마다 실행하는 함수
  final Function(InputImage inputImage) onImage;

  // 카메라 렌즈 방향 변수
  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  // 카메라를 다루기 위한 변수
  // 카메라 인덱스
  int _cameraIndex = -1;

  // 카메라 렌즈 변경 변수
  bool _changingCameraLens = false;

  @override
  void initState() {
    super.initState();

    // 카메라 설정. 기기에서 실행 가능한 카메라, 카메라 방향 설정...
    if (cameras.any(
      (element) =>
          element.lensDirection == widget.initialDirection &&
          element.sensorOrientation == 90,
    )) {
      _cameraIndex = cameras.indexOf(
        cameras.firstWhere((element) =>
            element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 90),
      );
    } else {
      for (var i = 0; i < cameras.length; i++) {
        if (cameras[i].lensDirection == widget.initialDirection) {
          _cameraIndex = i;
          break;
        }
      }
    }

    // 카메라 실행 가능하면 포즈 추출 시작
    if (_cameraIndex != -1) {
      _startLiveFeed();
    }
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  Widget createPositionedAnimal({
    required double left,
    required double top,
    required String animalName,
    required String assetPath,
    required int index,
  }) {
    if (useDummy) {
      if (animals[index].isEmpty) return Container();

      return Positioned(
        left: left,
        top: top,
        child: (animalName == animals[index][0])
            ? Image.asset(
                assetPath,
                height: 150,
                width: 150,
              )
            : Container(),
      );
    }

    if (gSceneModel == null ||
        gSceneModel!.scriptModelList.length <= index ||
        gSceneModel!.scriptModelList[index].animals_from_animal_list.isEmpty) {
      return Container(); // 조건에 맞지 않으면 빈 컨테이너 반환
    }
    return Positioned(
      left: left,
      top: top,
      child: gSceneModel!.scriptModelList[index].animals_from_animal_list
              .contains(animalName)
          ? Image.asset(
              assetPath,
              height: 150,
              width: 150,
            )
          : Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(gSceneModel!.scriptModelList[clr_index.value-1]
    //     .animals_from_animal_list[0]);
    if (clr_index.value == 0) {
      return Container();
    }
    if (clr_index.value - 1 == 8) {
      return Transform.scale(
        scale: 1,
        child: Container(
          height: 600,
          width: 600,
          child: Stack(
            children: [
              _liveFeedBody(),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 100,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi * cameraInverse),
                    child: RotatedBox(
                      quarterTurns: cameraTurn,
                      child: CameraPreview(controller.value!),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Transform.scale(
      scale: 1,
      child: Container(
        height: 600,
        width: 600,
        child: Stack(
          children: [
            createPositionedAnimal(
              left: tigerLocX.elementAt(clr_index.value - 1),
              top: tigerLocY.elementAt(clr_index.value - 1),
              animalName: "호랑이",
              assetPath: 'assets/animal/tiger.png',
              index: clr_index.value - 1,
            ),
            createPositionedAnimal(
              left: monkeyLocX.elementAt(clr_index.value - 1),
              top: monkeyLocY.elementAt(clr_index.value - 1),
              animalName: "원숭이",
              assetPath: 'assets/animal/monkey.png',
              index: clr_index.value - 1,
            ),
            createPositionedAnimal(
              left: giraffeLocX.elementAt(clr_index.value - 1),
              top: giraffeLocY.elementAt(clr_index.value - 1),
              animalName: "기린",
              assetPath: 'assets/animal/giraffe.png',
              index: clr_index.value - 1,
            ),
            createPositionedAnimal(
              left: koalaLocX.elementAt(clr_index.value - 1),
              top: koalaLocY.elementAt(clr_index.value - 1),
              animalName: "코알라",
              assetPath: 'assets/animal/koala.png',
              index: clr_index.value - 1,
            ),
            createPositionedAnimal(
              left: elephantLocX.elementAt(clr_index.value - 1),
              top: elephantLocY.elementAt(clr_index.value - 1),
              animalName: "코끼리",
              assetPath: 'assets/animal/elephant.png',
              index: clr_index.value - 1,
            ),
            createPositionedAnimal(
              left: lionLocX.elementAt(clr_index.value - 1),
              top: lionLocY.elementAt(clr_index.value - 1),
              animalName: "사자",
              assetPath: 'assets/animal/lion.png',
              index: clr_index.value - 1,
            ),
            createPositionedAnimal(
              left: puppyLocX.elementAt(clr_index.value - 1),
              top: puppyLocY.elementAt(clr_index.value - 1),
              animalName: "강아지",
              assetPath: 'assets/animal/puppy.png',
              index: clr_index.value - 1,
            ),
            _liveFeedBody(),
            Positioned(
              bottom: 0,
              child: Container(
                width: 100,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi * cameraInverse),
                  child: RotatedBox(
                    quarterTurns: cameraTurn,
                    child: CameraPreview(controller.value!),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 카메라 화면 보여주기 + 화면에서 실시간으로 포즈 추출
  Widget _liveFeedBody() {
    if (controller.value?.value.isInitialized == false) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    // 화면 및 카메라 비율에 따른 스케일 계산
    // 원문: calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * controller.value!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // 전면 후면 변경 시 화면 변경 처리
          Transform.scale(
            scale: scale - 1.2,
            child: Center(
              child: _changingCameraLens
                  ? const Center(
                      child: Text('Changing camera lens'),
                    )
                  : Container(), //CameraPreview(controller!),
            ),
          ),
        ],
      ),
    );
  }

  // 실시간으로 카메라에서 이미지 받기(비동기적)
  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    controller.value = CameraController(
      camera,
      ResolutionPreset.low,
      enableAudio: false,
    );
    controller.value?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      // 이미지 받은 것을 _processCameraImage 함수로 처리
      controller.value?.startImageStream(_processCameraImage);
      setState(() {});
    });
  }

  Future _stopLiveFeed() async {
    await controller.value?.stopImageStream();
    await controller.value?.dispose();
    controller.value = null;
  }

  // 전면<->후면 카메라 변경 함수
  Future _switchLiveCamera() async {
    setState(() => _changingCameraLens = true);
    _cameraIndex = (_cameraIndex + 1) % cameras.length;

    await _stopLiveFeed();
    await _startLiveFeed();
    setState(() => _changingCameraLens = false);
  }

  // 카메라에서 실시간으로 받아온 이미치 처리: PoseDetectorView에서 받아온 함수인 onImage(이미지에 포즈가 추출되었으면 스켈레톤 그려주는 함수) 실행
  Future _processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = cameras[_cameraIndex];
    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw);
    if (inputImageFormat == null) return;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    // PoseDetectorView에서 받아온 함수인 onImage(이미지에 포즈가 추출되었으면 스켈레톤 그려주는 함수) 실행
    widget.onImage(inputImage);
  }
}
