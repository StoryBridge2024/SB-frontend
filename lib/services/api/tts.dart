import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/constants/const.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import '../../constants/prompt.dart';
import '../util.dart';

class TTS {
  final String? apiKey = dotenv.env['OPENAI_APIKEY'];

  TTS._privateConstructor();

  static final TTS _instance = TTS._privateConstructor();

  factory TTS() {
    return _instance;
  }

  Future<String> createSpeech(String input) async {
    //compose prompt with input
    var ttsPrompt = deepCopy(TTS_PROMPT);
    ttsPrompt['input'] = input;

    //post request
    var response = await post(Uri.parse(baseTTSUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: json.encode(ttsPrompt));

    //parse response
    if (response.statusCode != 200) {
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      throw Exception('Failed to load TTS response');
    }

    // Get the directory for the app's temporary files.
    Directory tempDirectory = await getTemporaryDirectory();

    // Create a file path with timestamp so that multiple files do not overwrite each other.
    String filePath = '${tempDirectory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.mp3';

    // Write the file.
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    return file.path;
  }
}
