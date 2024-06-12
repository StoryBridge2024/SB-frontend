import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/fairytaleList.dart';
import 'getMessage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0xFF, 0xC9, 0xEE, 0xFC),
      body: Stack(
        children: [
          Positioned(
            right: 150,
            bottom: 50,
            child: Image.asset(
              'assets/image/img.png',
              scale: 5,
            ),
          ),
          Positioned(
            right: 75,
            bottom: 280,
            child: Image.asset(
              'assets/image/img_4.png',
              scale: 6,
            ),
          ),
          Positioned(
            left: 40,
            bottom: 40,
            child: Container(
              child: CallFromDB(context),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '스토리 브릿지',
                  style: TextStyle(
                      color: Color.fromARGB(0xFF, 0x22, 0x1A, 0x7E),
                      fontSize: 200,
                      fontFamily: 'JJI'),
                ),
              ),
              RequestFairytale(context),
            ],
          ),
        ],
      ),
    );
  }

  RequestFairytale(context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(40)),
        backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(0x75, 0x91, 0xB6, 0xFF),
        ),
      ),
      child: Text(
        '동화 제작하기',
        style: TextStyle(
          fontSize: 35,
          color: Color.fromARGB(0xFF, 0x4B, 0x4A, 0x53),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GetMessage(),
          ),
        );
      },
    );
  }

  CallFromDB(context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FairytaleList(),
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(
            'assets/image/동화책.png',
            height: 130,
          ),
          Text(
            '저장한 동화 보기',
            style: TextStyle(
              fontSize: 23,
              color: Color.fromARGB(0xFF, 0x4B, 0x4A, 0x53),
            ),
          )
        ],
      ),
    );
  }
}
