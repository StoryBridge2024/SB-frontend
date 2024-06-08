import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
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

  _renderContentFront(context, int index, color) {
    return Card(
      elevation: 0.0,
      color: Color(0x00000000),
      child: FlipCard(
        controller: controllerF[index],
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          isPageRunning = false;
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
                  decoration: BoxDecoration(
                    color: color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 7),
                      )
                    ],
                  ),
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
      color: Color(0x00000000),
      child: FlipCard(
        controller: controllerB[index],
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          isPageRunning = false;
        },
        front: Container(),
        back: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 7),
                      )
                    ],
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: (index != 8)
                      ? (useDummy)
                          ? Image.asset(
                              imgs[index],
                              height: 600,
                              width: 600,
                            )
                          : Image.memory(
                              base64Decode(
                                gSceneModel!.b64_images.elementAt(index),
                              ),
                              height: 600,
                              width: 600,
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
        Expanded(
          flex: 1,
          child: Container(),
        ),
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
        Expanded(
          flex: 1,
          child: Container(),
        ),
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
    return Container(
      child: Stack(
        children: <Widget>[
          FrontOnStack(context, 8, Color(0xFFFFFFFF)), // 8th page right
          FrontOnStack(context, 7, Color(0xFFFFFFFF)), // 7th page right
          FrontOnStack(context, 6, Color(0xFFFFFFFF)), // 6th page right
          FrontOnStack(context, 5, Color(0xFFFFFFFF)), // 5th page right
          FrontOnStack(context, 4, Color(0xFFFFFFFF)), // 4th page right
          FrontOnStack(context, 3, Color(0xFFFFFFFF)), // 3rd page right
          FrontOnStack(context, 2, Color(0xFFFFFFFF)), // 2nd page right
          FrontOnStack(context, 1, Color(0xFFFFFFFF)), // 1st page right
          FrontOnStack(context, 0, Colors.black), // front cover
          BackOnStack(context, 0, Color(0xFFFFFFFF)), // 1st page left
          BackOnStack(context, 1, Color(0xFFFFFFFF)), // 2nd page left
          BackOnStack(context, 2, Color(0xFFFFFFFF)), // 3rd page left
          BackOnStack(context, 3, Color(0xFFFFFFFF)), // 4th page left
          BackOnStack(context, 4, Color(0xFFFFFFFF)), // 5th page left
          BackOnStack(context, 5, Color(0xFFFFFFFF)), // 6th page left
          BackOnStack(context, 6, Color(0xFFFFFFFF)), // 7th page left
          BackOnStack(context, 7, Color(0xFFFFFFFF)), // 8th page left
          BackOnStack(context, 8, Colors.black), // back cover
          pageFlip(),
        ],
      ),
    );
  }

  Widget ShadowContainer() {
    return ValueListenableBuilder<int>(
      valueListenable: clr_index,
      builder: (context, value, _) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: (clr_index.value != 0)
                        ? Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0, 7),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ),
                  Flexible(
                    flex: 1,
                    child: (clr_index.value != 9)
                        ? Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0, 7),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        );
      },
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
