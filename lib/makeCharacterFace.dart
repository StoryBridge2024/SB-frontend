import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MakeCharacterFace extends StatefulWidget {
  final XFile? file;

  const MakeCharacterFace({super.key, required this.file});

  @override
  State<MakeCharacterFace> createState() => _MakeCharacterFaceState();
}

class _MakeCharacterFaceState extends State<MakeCharacterFace> {
  double locX = 0;
  double locY = 0;

  @override
  Widget build(BuildContext context) {
    XFile? file = widget.file;

    return Scaffold(
        body: Container(
          color: Color.fromARGB(0xFF, 0xB9, 0xEE, 0xFF),
          child: Column(children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '캐릭터 제작하기',
                style: TextStyle(
                    fontSize: 60, color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA)),
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
                        child: Image.file(
                          File(file!.path),
                          fit: BoxFit.cover,
                          scale: 2,
                        ),
                      ),
                      Center(
                        child: Container(
                          color: Colors.red,
                          width: 100,
                          height: 100,
                          child: Text('여기에 얼굴 틀 넣어야됨'),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 2000,
                          height: 2000,
                          color: Color(0x0000000),
                          child: GestureDetector(
                            onScaleUpdate: (touch) {
                              setState(() {
                                locX += touch.focalPointDelta.dx;
                                locY += touch.focalPointDelta.dy;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: FloatingActionButton(
                              backgroundColor: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 50,
                              ),
                              onPressed: () {

                              }),
                        ),
                      )
                    ],
                  ),
                ))
          ]),
        ));
  }
}
