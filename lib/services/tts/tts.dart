import 'package:flutter_dotenv/flutter_dotenv.dart';

class TTS {
  final String? apiKey = dotenv.env['OPENAI_APIKEY'];

  TTS._privateConstructor();

  static final TTS _instance = TTS._privateConstructor();

  factory TTS() {
    return _instance;
  }
  Future<void> createSpeech(String text) async {

  }
}

// curl https://api.openai.com/v1/audio/speech \
// -H "Authorization: Bearer ${API_KEY}" \
// -H "Content-Type: application/json" \
// -d '{
// "model": "tts-1",
// "input": "주영이와 해승이와 예진이가 캡스톤을 하고 있어요. 정말 너무 재미있는 프로젝트예요.",
// "voice": "shimmer"
// }' \
// --output speech.mp3