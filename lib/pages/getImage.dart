import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'makeCharacterFace.dart';
import 'makeCharacterBody.dart';

class GetImageFromGallery extends StatefulWidget {
  const GetImageFromGallery({super.key});

  @override
  State<GetImageFromGallery> createState() => _GetImageFromGalleryState();
}

class _GetImageFromGalleryState extends State<GetImageFromGallery> {
  XFile? file;
  CroppedFile? _croppedFile;

  Future<void> _pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (image) {
        if (image != null) {
          file = image;
          cropImage();

          // setState(
          //   () {
          //     file = image;
          //   },
          // );
        }
      },
    );
  }

  // 이미지를 자르거나 회전하는 함수
  Future<void> cropImage() async {
    if (file != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: file!.path, // 사용할 이미지 경로
        compressFormat: ImageCompressFormat.jpg, // 저장할 이미지 확장자(jpg/png)
        compressQuality: 100, // 저장할 이미지의 퀄리티
        uiSettings: [
          // 안드로이드 UI 설정
          AndroidUiSettings(
              toolbarTitle: '이미지 자르기/회전하기',
              // 타이틀바 제목
              toolbarColor: Colors.deepOrange,
              // 타이틀바 배경색
              toolbarWidgetColor: Colors.white,
              // 타이틀바 단추색
              initAspectRatio: CropAspectRatioPreset.original,
              // 이미지 크로퍼 시작 시 원하는 가로 세로 비율
              lockAspectRatio: false), // 고정 값으로 자르기 (기본값 : 사용안함)
          // iOS UI 설정
          IOSUiSettings(
            title: '이미지 자르기/회전하기', // 보기 컨트롤러의 맨 위에 나타나는 제목
          ),
          // Web UI 설정
          WebUiSettings(
            context: context,
            // 현재 빌드 컨텍스트
            presentStyle: CropperPresentStyle.dialog,
            // 대화 상자 스타일
            boundary: // 크로퍼의 외부 컨테이너 (기본값 : 폭 500, 높이 500)
                const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort: // 이미지가 보이는 부분 (기본값 : 폭 400, 높이 400, 유형 사각형)
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            // 디지털 카메라 이미지 파일 확장자 사용
            enableZoom: true,
            // 확대/축소 기능 활성화 (기본값 : false)
            showZoomer: true, // 확대/축소 슬라이더 표시/숨김 (기본값 : true)
          ),
        ],
      );

      if (croppedFile != null) {
        // 자르거나 회전한 이미지를 앱에 출력하기 위해 앱의 상태 변경
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final length = MediaQuery.of(context).size.width;

    Widget temp = ClipPath(
      clipper: MyClipper(),
      child: (_croppedFile != null)
          ? Image.file(
              File(_croppedFile!.path),
              fit: BoxFit.cover,
            )
          : Container(),
    );
    if (file != null && _croppedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MakeCharacterBody(
            file: temp,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
        actions: [
          IconButton(onPressed: _pickImage, icon: const Icon(Icons.image))
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          height: length,
          width: length,
          child: (file != null)
              ? Image.file(
                  File(file!.path),
                  fit: BoxFit.cover,
                )
              : const Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}

class GetImageFromCamera extends StatefulWidget {
  const GetImageFromCamera({super.key});

  @override
  State<GetImageFromCamera> createState() => _GetImageFromCameraState();
}

class _GetImageFromCameraState extends State<GetImageFromCamera> {
  XFile? file;
  CroppedFile? _croppedFile;

  Future<void> _pickImage() async {
    ImagePicker().pickImage(source: ImageSource.camera).then(
      (image) {
        if (image != null) {
          file = image;
          cropImage();
          // setState(
          //   () {
          //     file = image;
          //   },
          // );
        }
      },
    );
  }

  // 이미지를 자르거나 회전하는 함수
  Future<void> cropImage() async {
    if (file != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: file!.path, // 사용할 이미지 경로
        compressFormat: ImageCompressFormat.jpg, // 저장할 이미지 확장자(jpg/png)
        compressQuality: 100, // 저장할 이미지의 퀄리티
        uiSettings: [
          // 안드로이드 UI 설정
          AndroidUiSettings(
              toolbarTitle: '이미지 자르기/회전하기',
              // 타이틀바 제목
              toolbarColor: Colors.lightBlueAccent,
              // 타이틀바 배경색
              toolbarWidgetColor: Colors.white,
              // 타이틀바 단추색
              initAspectRatio: CropAspectRatioPreset.original,
              // 이미지 크로퍼 시작 시 원하는 가로 세로 비율
              lockAspectRatio: false), // 고정 값으로 자르기 (기본값 : 사용안함)
          // iOS UI 설정
          IOSUiSettings(
            title: '이미지 자르기/회전하기', // 보기 컨트롤러의 맨 위에 나타나는 제목
          ),
          // Web UI 설정
          WebUiSettings(
            context: context,
            // 현재 빌드 컨텍스트
            presentStyle: CropperPresentStyle.dialog,
            // 대화 상자 스타일
            boundary: // 크로퍼의 외부 컨테이너 (기본값 : 폭 500, 높이 500)
                const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort: // 이미지가 보이는 부분 (기본값 : 폭 400, 높이 400, 유형 사각형)
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            // 디지털 카메라 이미지 파일 확장자 사용
            enableZoom: true,
            // 확대/축소 기능 활성화 (기본값 : false)
            showZoomer: true, // 확대/축소 슬라이더 표시/숨김 (기본값 : true)
          ),
        ],
      );

      if (croppedFile != null) {
        // 자르거나 회전한 이미지를 앱에 출력하기 위해 앱의 상태 변경
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final length = MediaQuery.of(context).size.width;

    Widget temp = ClipPath(
      clipper: MyClipper(),
      child: (_croppedFile != null)
          ? Image.file(
        File(_croppedFile!.path),
        fit: BoxFit.cover,
      )
          : Container(),
    );
    if (file != null && _croppedFile != null) {
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MakeCharacterBody(
            file: temp,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
        actions: [
          IconButton(onPressed: _pickImage, icon: const Icon(Icons.image))
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          height: length,
          width: length,
          child: (file != null)
              ? Image.file(
                  File(file!.path),
                  fit: BoxFit.cover,
                )
              : const Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
