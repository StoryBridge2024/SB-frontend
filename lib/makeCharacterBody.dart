import 'package:flutter/material.dart';

import './showFairytale.dart';

class MakeCharacterBody extends StatelessWidget {
  const MakeCharacterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(0xFF, 0xB9, 0xEE, 0xFF),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                '캐릭터 제작하기',
                style: TextStyle(
                  fontSize: 60,
                  color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFFFFFFF),
                margin: EdgeInsets.all(25),
                child: Container(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShowFairytale(),
                          ),
                        );
                      },
                    ),
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
