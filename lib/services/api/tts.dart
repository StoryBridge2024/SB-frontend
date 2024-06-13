import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  Future<Uint8List> createSpeech(String input) async {
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

    return response.bodyBytes;
  }
}
