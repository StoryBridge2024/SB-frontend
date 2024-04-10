import 'package:flutter/material.dart';
import './loadingPage.dart';

class GetMessage extends StatefulWidget {
  const GetMessage({super.key});

  @override
  State<GetMessage> createState() => _GetMessageState();
}

class _GetMessageState extends State<GetMessage> {
  var tec = TextEditingController(text: '');

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
                '교훈 입력',
                style: TextStyle(
                  fontSize: 60,
                  color: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                ),
              ),
            ),
            Expanded(
              child: Scaffold(
                backgroundColor: Color(0x00ffffff),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.fromLTRB(200, 0, 200, 0),
                        child: TextField(
                          style: TextStyle(fontSize: 40),
                          controller: tec,
                          decoration: InputDecoration(
                            hintText: '아이에게 전하고 싶은 메세지를 입력해주세요',
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
                            shape: StadiumBorder(),
                            padding: EdgeInsets.all(30),
                          ),
                          child: Text(
                            '다음',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SendAPI(text: tec.text),
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
    );
  }
}
