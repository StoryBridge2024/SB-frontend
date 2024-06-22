import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:frontend/constants/fairytaleConstants.dart';
import 'package:frontend/pages/settingCamera.dart';
import 'package:scribble/scribble.dart';
import 'package:value_notifier_tools/value_notifier_tools.dart';

class ShowImage extends StatefulWidget {
  var image;

  ShowImage({super.key, required this.image});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MakeCharacterBody extends StatelessWidget {
  const MakeCharacterBody({super.key, required this.file});

  final Widget file;

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
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFFFFFFF),
                margin: EdgeInsets.all(25),
                child: DrawBox(
                  face: file,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawBox extends StatefulWidget {
  DrawBox({super.key, required this.face});
  final Widget face;

  @override
  State<DrawBox> createState() => _DrawBoxState();
}

class _DrawBoxState extends State<DrawBox> {
  late ScribbleNotifier notifier;

  @override
  void initState() {
    notifier = ScribbleNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var face = widget.face;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                      Flexible(
                        flex: 11,
                        child: Stack(
                          children: [
                            Scribble(
                              notifier: notifier,
                              drawPen: true,
                            ),
                            IgnorePointer(
                              child: CharacterShape(face),
                            ),
                          ],
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
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  _buildColorToolbar(context),
                  const VerticalDivider(width: 32),
                  _buildStrokeToolbar(context),
                  const Expanded(child: SizedBox()),
                  Row(
                    children: _buildActions(context, face),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  CharacterShape(face) {
    return Row(
      children: [
        Flexible(
          flex: 23,
          child: Container(),
        ),
        Flexible(
          flex: 18,
          child: Column(
            children: [
              Flexible(
                flex: 13,
                child: Container(), // 투명한 컨테이너
              ),
              Flexible(
                flex: 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Container(),
                ),
              ),
              Flexible(
                flex: 31,
                child: Container(),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 12,
          child: Column(
            children: [
              Flexible(
                flex: 13,
                child: Container(
                  height: double.infinity,
                  child: Center(
                    child: face,
                  ),
                ),
              ),
              Flexible(
                flex: 15,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Container(),
                ),
              ),
              Flexible(
                flex: 20,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Container(),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 18,
          child: Column(
            children: [
              Flexible(
                flex: 13,
                child: Container(),
              ),
              Flexible(
                flex: 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Container(),
                ),
              ),
              Flexible(
                flex: 31,
                child: Container(),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 23,
          child: Container(),
        ),
      ],
    );
  }

  List<Widget> _buildActions(context, var face) {
    List<Uint8List> images = [];
    return [
      ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, child) => IconButton(
          icon: child as Icon,
          tooltip: "Undo",
          onPressed: notifier.canUndo ? notifier.undo : null,
        ),
        child: const Icon(Icons.undo),
      ),
      ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, child) => IconButton(
          icon: child as Icon,
          tooltip: "Redo",
          onPressed: notifier.canRedo ? notifier.redo : null,
        ),
        child: const Icon(Icons.redo),
      ),
      IconButton(
        icon: const Icon(Icons.clear),
        tooltip: "Clear",
        onPressed: notifier.clear,
      ),
      Container(
        width: 20,
      ),
      FloatingActionButton(
        backgroundColor: Color.fromARGB(0xFF, 0x3B, 0x2F, 0xCA),
        shape: CircleBorder(),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 50,
        ),
        onPressed: () => _nextPage(context, images),
      ),
    ];
  }

  void _nextPage(BuildContext context, List<Uint8List> images) async {
    var face = widget.face;
    final image = notifier.renderImage();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Generated Image"),
        content: SizedBox(
          height: 400,
          width: 400,
          child: FutureBuilder<List<Uint8List>>(
            future: image.then((imgData) async {
              Uint8List imagedata = imgData.buffer.asUint8List();

              Uint8List resizedImageData =
                  await _resizeImageToMultiple(imagedata);

              var temp = Future.wait([
                _extractTile(resizedImageData, 41, 13, 12, 15), //0 몸통
                _extractTile(resizedImageData, 32, 13, 9, 5), //1 왼팔 팔꿈치~어깨
                _extractTile(resizedImageData, 23, 13, 9, 5), //2 왼팔 손~팔꿈치
                _extractTile(resizedImageData, 53, 13, 9, 5), //3 오른팔 팔꿈치~어깨
                _extractTile(resizedImageData, 62, 13, 9, 5), //4 오른팔 손~팔꿈치
                _extractTile(resizedImageData, 41, 28, 6, 10), //5 왼다리 위
                _extractTile(resizedImageData, 41, 38, 6, 10), //6 왼다리 아래
                _extractTile(resizedImageData, 47, 28, 6, 10), //7 오른 다리 위
                _extractTile(resizedImageData, 47, 38, 6, 10) //8 오른 다리 아래
              ]);

              clr_index.value = 9;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingCam(body: images, face: face),
                ),
              );
              return temp;
            }),
            builder: (BuildContext context,
                AsyncSnapshot<List<Uint8List>> snapshot) {
              if (snapshot.hasData) {
                images.clear();
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    images.add(snapshot.data![index].buffer.asUint8List());
                    return Image.memory(
                      snapshot.data![index].buffer.asUint8List(),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  Future<Uint8List> _resizeImageToMultiple(Uint8List imageData) async {
    final codec = await instantiateImageCodec(imageData);
    final frame = await codec.getNextFrame();
    final image = frame.image;

    // Calculate new width and height as multiples of 94
    int newWidth = (image.width / 94).ceil() * 94;
    int newHeight = (image.height / 49).ceil() * 49;

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();

    // Draw the resized image
    canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromLTWH(0, 0, newWidth.toDouble(), newHeight.toDouble()),
        paint);

    final picture = recorder.endRecording();
    final resizedImage = await picture.toImage(newWidth, newHeight);
    final byteData = await resizedImage.toByteData(format: ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<Uint8List> _extractTile(Uint8List imageData, int startCol,
      int startRow, int numCols, int numRows) async {
    final codec = await instantiateImageCodec(imageData);
    final frame = await codec.getNextFrame();
    final image = frame.image;

    final int tileWidth = image.width ~/ 94;
    final int tileHeight = image.height ~/ 46;

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();

    // Clip and draw the top left tile
    canvas.drawImageRect(
        image,
        Rect.fromLTWH(
            startCol * tileWidth.toDouble(),
            startRow * tileHeight.toDouble(),
            numCols * tileWidth.toDouble(),
            numRows * tileHeight.toDouble()),
        Rect.fromLTWH(0, 0, numCols * tileWidth.toDouble(),
            numRows * tileHeight.toDouble()),
        paint);

    final picture = recorder.endRecording();
    final img =
        await picture.toImage(numCols * tileWidth, numRows * tileHeight);
    final byteData = await img.toByteData(format: ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Widget _buildStrokeToolbar(BuildContext context) {
    return ValueListenableBuilder<ScribbleState>(
      valueListenable: notifier,
      builder: (context, state, _) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final w in notifier.widths)
            _buildStrokeButton(
              context,
              strokeWidth: w,
              state: state,
            ),
        ],
      ),
    );
  }

  Widget _buildStrokeButton(
    BuildContext context, {
    required double strokeWidth,
    required ScribbleState state,
  }) {
    final selected = state.selectedWidth == strokeWidth;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        elevation: selected ? 4 : 0,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () => notifier.setStrokeWidth(strokeWidth / 4),
          customBorder: const CircleBorder(),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            width: strokeWidth * 4,
            height: strokeWidth * 4,
            decoration: BoxDecoration(
                color: state.map(
                  drawing: (s) => Color(s.selectedColor),
                  erasing: (_) => Colors.transparent,
                ),
                border: state.map(
                  drawing: (_) => null,
                  erasing: (_) => Border.all(width: 1),
                ),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildColorToolbar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildColorButton(context, color: Colors.black),
        _buildColorButton(context, color: Colors.red),
        _buildColorButton(context, color: Colors.green),
        _buildColorButton(context, color: Colors.blue),
        _buildColorButton(context, color: Colors.yellow),
        _buildColorPickerButton(context),
        _buildEraserButton(context),
      ],
    );
  }

  Widget _buildColorPickerButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.palette),
      onPressed: () => _showColorPicker(context),
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color pickerColor = Color(0xff443a49); // Default color
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (Color color) {
                notifier.setColor(color);
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildEraserButton(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier.select((value) => value is Erasing),
      builder: (context, value, child) => ColorButton(
        color: Colors.transparent,
        outlineColor: Colors.black,
        isActive: value,
        onPressed: () => notifier.setEraser(),
        child: const Icon(Icons.cleaning_services),
      ),
    );
  }

  Widget _buildColorButton(
    BuildContext context, {
    required Color color,
  }) {
    return ValueListenableBuilder(
      valueListenable: notifier.select(
          (value) => value is Drawing && value.selectedColor == color.value),
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ColorButton(
          color: color,
          isActive: value,
          onPressed: () => notifier.setColor(color),
        ),
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({
    required this.color,
    required this.isActive,
    required this.onPressed,
    this.outlineColor,
    this.child,
    super.key,
  });

  final Color color;

  final Color? outlineColor;

  final bool isActive;

  final VoidCallback onPressed;

  final Icon? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: switch (isActive) {
              true => outlineColor ?? color,
              false => Colors.transparent,
            },
            width: 2,
          ),
        ),
      ),
      child: IconButton(
        style: FilledButton.styleFrom(
          backgroundColor: color,
          shape: const CircleBorder(),
          side: isActive
              ? const BorderSide(color: Colors.white, width: 2)
              : const BorderSide(color: Colors.transparent),
        ),
        onPressed: onPressed,
        icon: child ?? const SizedBox(),
      ),
    );
  }
}
