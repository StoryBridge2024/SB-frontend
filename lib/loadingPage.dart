import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import './makingFairytale.dart';

class SendAPI extends StatefulWidget {
  final String text;
  const SendAPI({super.key, required this.text});

  @override
  State<SendAPI> createState() => _SendAPIState();
}

class _SendAPIState extends State<SendAPI> {
  @override
  Widget build(BuildContext context) {
    String text = widget.text;

    //일단 여기에 대기할 수 있게 만들었는데, 나중에 API 받아와지면 넘어가게 만들면 될듯
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MakeFairytale(),
          ),
        );
      },
    );

    return Scaffold(
      body: Container(
        color: Color.fromARGB(0xFF, 0xB9, 0xEE, 0xFF),
        alignment: Alignment.center,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Text(
                  '동화 제작 중',
                  style: TextStyle(
                    fontSize: 125,
                    color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: SpinKitFadingCircle(
                  color: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
                  size: 200,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
