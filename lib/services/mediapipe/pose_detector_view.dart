import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/const.dart';
import 'package:frontend/constants/dummy_data.dart';
import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:frontend/services/mediapipe/movement_follow.dart';
import 'package:frontend/services/mediapipe/pose_arrange.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import 'camera_view.dart';

import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:audioplayers/audioplayers.dart';

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

  String _kindOfPose = "";
  var _movementFollow;
  bool _showStamp = false;
  final _missionAudioPlayer = AudioPlayer();
  final _ttsAudioPlayer = AudioPlayer();

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
    _missionAudioPlayer.dispose();
    _ttsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (clr_index.value == 0) {
      return Container();
    }
    // 카메라뷰 보이기
    return Stack(
      children: [
        Container(
          height: 600,
          width: 600,
          child: CameraView(
            // 카메라에서 전해주는 이미지 받을 때마다 아래 함수 실행
            onImage: (inputImage) {
              processImage(inputImage);
            },
          ),
        ),
        Positioned(
          left: humanLocX.elementAt(clr_index.value - 1) - 130,
          top: humanLocY.elementAt(clr_index.value - 1) - 240,
          child: Container(
            width: 600,
            child: RotatedBox(
              quarterTurns: 3,
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  alignment: Alignment.center,
                  width: 600,
                  height: 1000,
                  child: _movementFollow,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void init() {
    count = List.filled(11, 0);
    leftWristXChanges = [];
    rightWristXChanges = [];
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

      if (!doMissionChecking) {
        init();
      }

      var index = clr_index.value - 1;
      if (index != -1 && index != 8) {
        if (doTTSRunning) {
          doTTSRunning = false;

          if (useDummy) {
            _playTTS(audios[index]);
          } else if (!useDummy) {
            _playTTS(gSceneModel!.audioSource[index]);
          }
        }

        if (doMissionChecking) {
          if (useDummy) {
            if (_kindOfPose.replaceAll(" ", "") ==
                missions[index].replaceAll(" ", "")) {
              doMissionChecking = false;
              doStampRunning = true;
              missionClear(_kindOfPose);
            }
          } else if (!useDummy) {
            if ((gSceneModel!
                        .scriptModelList[index].action_used_in_action_list ==
                    null) ||
                (gSceneModel!.scriptModelList[index].action_used_in_action_list!
                        .replaceAll(" ", "") ==
                    "null") ||
                (_kindOfPose.replaceAll(" ", "") ==
                    gSceneModel!
                        .scriptModelList[index].action_used_in_action_list!
                        .replaceAll(" ", ""))) {
              doMissionChecking = false;
              doStampRunning = true;
              missionClear(_kindOfPose);
            }
          }
        }
      }
    } else {
      _movementFollow = Container();
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  void missionClear(kindOfPose) {
    if (doStampRunning) {
      doStampRunning = false;
      if (kindOfPose.replaceAll(" ", "") == "") {
        doPageMovementRunning = true;
        toggle(true);
      } else {
        missionclear.value = true;
        _showStampEffect();
        _missionAudioPlayer.play(AssetSource('audio/whistle.mp3'));
        _missionAudioPlayer.onPlayerComplete.listen(
          (event) {
            doPageMovementRunning = true;
            toggle(true);
          },
        );
      }
    }
  }

  Future<void> _playTTS(var audioBytes) async {
    try {
      print('Attempting to play TTS...');
      if (!useDummy) {
        await _ttsAudioPlayer.play(BytesSource(audioBytes)); // TTS 재생
      } else {
        await _ttsAudioPlayer.play(AssetSource(audioBytes));
      }
      print('TTS playing...');
      _ttsAudioPlayer.onPlayerComplete.listen(
        (event) {
          setState(
            () {
              doMissionChecking = true;
            },
          );
        },
      );
    } catch (e) {
      print('Error playing TTS: $e');
    }
  }

  void _showStampEffect() {
    setState(() {
      _showStamp = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showStamp = false;
      });
    });
  }
}
