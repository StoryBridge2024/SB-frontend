import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'makeCharacterFace.dart';

class GetImageFromGallery extends StatefulWidget {
  const GetImageFromGallery({super.key});

  @override
  State<GetImageFromGallery> createState() => _GetImageFromGalleryState();
}

class _GetImageFromGalleryState extends State<GetImageFromGallery> {
  XFile? file;

  Future<void> _pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (image) {
        if (image != null) {
          setState(
            () {
              file = image;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final length = MediaQuery.of(context).size.width;

    if (file != null) {
      Future.delayed(
        const Duration(milliseconds: 2000),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MakeCharacterFace(file: file)),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
        actions: [
          IconButton(onPressed: _pickImage, icon: const Icon(Icons.image))
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          height: length,
          width: length,
          child: (file != null)
              ? Image.file(
                  File(file!.path),
                  fit: BoxFit.cover,
                )
              : const Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}

class GetImageFromCamera extends StatefulWidget {
  const GetImageFromCamera({super.key});

  @override
  State<GetImageFromCamera> createState() => _GetImageFromCameraState();
}

class _GetImageFromCameraState extends State<GetImageFromCamera> {
  XFile? file;

  Future<void> _pickImage() async {
    ImagePicker().pickImage(source: ImageSource.camera).then(
      (image) {
        if (image != null) {
          setState(
            () {
              file = image;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final length = MediaQuery.of(context).size.width;

    if (file != null) {
      Future.delayed(
        const Duration(milliseconds: 2000),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MakeCharacterFace(file: file)),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
        actions: [
          IconButton(onPressed: _pickImage, icon: const Icon(Icons.image))
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          height: length,
          width: length,
          child: (file != null)
              ? Image.file(
                  File(file!.path),
                  fit: BoxFit.cover,
                )
              : const Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
