import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'makeCharacterBody.dart';

class MakeCharacterFace extends StatefulWidget {
  const MakeCharacterFace({super.key, required this.file});

  final CroppedFile? file;

  @override
  State<MakeCharacterFace> createState() => _MakeCharacterFaceState();
}

class MyClipper extends CustomClipper<Path> {
  MyClipper();

  @override
  Path getClip(Size size) {
    // 클리핑 경로가 이미지의 중앙에 위치하도록 조정
    final center = Offset(size.width / 2, size.height / 2);
    final width = size.width * 0.9; // 이미지 너비의 90%를 타원의 너비로 사용
    final height = size.height * 0.9; // 이미지 높이의 90%를 타원의 높이로 사용

    Path path = Path()
      ..addOval(Rect.fromCenter(center: center, width: width, height: height))
      ..close();
    // Path path = Path()
    //   ..addOval(Rect.fromCenter(center: Offset(50, 60), width: 40, height: 70))
    //   ..addOval(Rect.fromPoints(Offset(150, 150), Offset(200, 200)))
    //   ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _MakeCharacterFaceState extends State<MakeCharacterFace> {
  double locX = 0;
  double locY = 0;
  double scaleFactor = 1.0;
  double baseScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    CroppedFile? file = widget.file;

    return Scaffold(
      body: Container(
        color: Color.fromARGB(0xFF, 0xD1, 0xF7, 0xFA),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '캐릭터 제작하기',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(0xFF, 0x13, 0x13, 0x13),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFFFFFFF),
                margin: EdgeInsets.all(25),
                child: Stack(
                  children: [
                    Positioned(
                      left: locX,
                      top: locY,
                      child: GestureDetector(
                        // child: Image.file(
                        //   File(file!.path),
                        //   fit: BoxFit.cover,
                        //   scale: 1 / scaleFactor,
                        // ),
                        onScaleStart: (touch) {
                          baseScaleFactor = scaleFactor;
                        },
                        onScaleUpdate: (touch) {
                          setState(
                            () {
                              locX += touch.focalPointDelta.dx;
                              locY += touch.focalPointDelta.dy;
                              if (touch.scale != 1) {
                                scaleFactor = baseScaleFactor * touch.scale;
                              }
                              print(scaleFactor);
                            },
                          );
                        },
                      ),
                    ),
                    Center(
                      child: IgnorePointer(
                        ignoring: true,
                        child: ClipPath(
                            clipper: MyClipper(),
                            child: (file != null)
                                ? Image.file(
                                    File(file!.path),
                                    fit: BoxFit.cover,
                                  )
                                : Container()),
                        // child: Image.asset(
                        //   'assets/image/face.png',
                        //   color: Colors.red,
                        // ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: FloatingActionButton(
                          backgroundColor:
                              Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 50,
                          ),
                          onPressed: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => MakeCharacterBody(
                                  file: ClipPath(
                                    clipper: MyClipper(),
                                    child: (file != null)
                                        ? Image.file(
                                            File(file!.path),
                                            fit: BoxFit.cover,
                                          )
                                        : Container(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
