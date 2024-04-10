import 'package:flutter/material.dart';
import './getMessage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0xFF, 0xB9, 0xEE, 0xFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '스토리 브릿지',
              style: TextStyle(
                  color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                  fontSize: 200,
                  fontFamily: 'BMKIRANGHAERANG'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(40)),
              backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(0x75, 0x91, 0xB6, 0xFF),
              ),
            ),
            child: Text(
              '동화 제작하기',
              style: TextStyle(
                fontSize: 50,
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
          ),
        ],
      ),
    );
  }
}
