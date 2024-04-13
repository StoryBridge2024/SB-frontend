import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/services/api/openai.dart';
import './homePage.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  OpenAI openAI = OpenAI();
  var response = await openAI.createCompletion();
  print(response.body);
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
      home: HomePage(),
    );
  }
}
