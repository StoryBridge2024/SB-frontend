import 'package:flutter/material.dart';
import 'getImage.dart';

class MakeCharacter extends StatelessWidget {
  const MakeCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(0xFF, 0xD1, 0xEB, 0xFF),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '캐릭터를 만들어봐요!',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(0xFF, 0x13, 0x13, 0x13),
                ),
              ),
            ),
            Expanded(
              child: Scaffold(
                backgroundColor: Color(0x00000000),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Color(0xffffffff),
                  margin: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            '먼저 얼굴을 제작해야 해요!',
                            style: TextStyle(fontSize: 70),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFFFFFF),
                                        surfaceTintColor: Color(0xFFFFFFFF),
                                        shape: BeveledRectangleBorder(),
                                        elevation: 0,
                                        foregroundColor: Color(0x00000000),
                                        padding: EdgeInsets.all(30)),
                                    child: Image.asset(
                                      'assets/image/img_2.png',
                                      width: 250,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const GetImageFromCamera(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFFFFFFF),
                                      surfaceTintColor: Color(0xFFFFFFFF),
                                      shape: BeveledRectangleBorder(),
                                      elevation: 0,
                                      foregroundColor: Color(0x00000000),
                                      padding: EdgeInsets.all(30),
                                    ),
                                    child: Image.asset(
                                      'assets/image/img_3.png',
                                      width: 300,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const GetImageFromGallery(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
