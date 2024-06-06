import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/dummy_data.dart';
import 'package:frontend/constants/fairytaleConstants.dart';

class Book extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BookHomePage();
  }
}

class BookHomePage extends StatelessWidget {
  _renderBg() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFFFFFFF)),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0x00FFFFFF),
      ),
    );
  }

  _renderContentFront(context, int index, color) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        controller: controllerF[index],
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          isTemp1Running = false;
          isTemp2Running = false;
        },
        front: Container(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: color,
                  child: (index != 0) ? pages[index - 1] : Container(),
                ),
              ),
            ],
          ),
        ),
        back: Container(),
      ),
    );
  }

  _renderContentBack(context, int index, color) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        controller: controllerB[index],
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          isTemp1Running = false;
          isTemp2Running = false;
        },
        front: Container(),
        back: Container(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: color,
                  child: (index != 8)
                      ? (useDummy)
                          ? Image.asset(
                              imgs[index],
                              height: 500,
                              width: 500,
                            )
                          : Image.memory(
                              base64Decode(
                                gSceneModel!.b64_images.elementAt(index),
                              ),
                              height: 500,
                              width: 500,
                            )
                      : Container(),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FrontOnStack(context, index, color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _renderAppBar(context),
        Expanded(
          flex: 10,
          child: _renderContentFront(context, index, color),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }

  BackOnStack(context, index, color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _renderAppBar(context),
        Expanded(
          flex: 10,
          child: _renderContentBack(context, index, color),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          FrontOnStack(context, 8, Colors.deepPurpleAccent), // 8th page right
          FrontOnStack(context, 7, Colors.indigo), // 7th page right
          FrontOnStack(context, 6, Colors.blueAccent), // 6th page right
          FrontOnStack(context, 5, Colors.green), // 5th page right
          FrontOnStack(context, 4, Colors.lightGreen), // 4th page right
          FrontOnStack(context, 3, Colors.yellow), // 3rd page right
          FrontOnStack(context, 2, Colors.orange), // 2nd page right
          FrontOnStack(context, 1, Colors.red), // 1st page right
          FrontOnStack(context, 0, Colors.black), // front cover
          BackOnStack(context, 0, Colors.red), // 1st page left
          BackOnStack(context, 1, Colors.orange), // 2nd page left
          BackOnStack(context, 2, Colors.yellow), // 3rd page left
          BackOnStack(context, 3, Colors.lightGreen), // 4th page left
          BackOnStack(context, 4, Colors.green), // 5th page left
          BackOnStack(context, 5, Colors.blueAccent), // 6th page left
          BackOnStack(context, 6, Colors.indigo), // 7th page left
          BackOnStack(context, 7, Colors.deepPurpleAccent), // 8th page left
          BackOnStack(context, 8, Colors.black), // back cover
          pageFlip(),
        ],
      ),
    );
  }

  pageFlip() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: FloatingActionButton(
              elevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              focusColor: Color(0x00000000),
              backgroundColor: Color(0x00000000),
              onPressed: () {
                toggle(false);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: FloatingActionButton(
              elevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              focusColor: Color(0x00000000),
              hoverColor: Color(0x00000000),
              backgroundColor: Color(0x00000000),
              onPressed: () {
                toggle(true);
              },
            ),
          ),
        ),
      ],
    );
  }
}
