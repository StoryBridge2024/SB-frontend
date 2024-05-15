import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/pages/makeCharacterBody.dart';
import 'pages/homePage.dart';
import 'package:camera/camera.dart';
import 'pages/makeCharacterBody.dart';
import 'package:frontend/constants/dummy_data.dart';

List<CameraDescription> cameras = [];

void main() async {
  clr_index.value = 0;
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MakeCharacterBody(),
    );
  }
}
