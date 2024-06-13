import 'dart:collection';
import 'dart:convert';
import 'dart:math';

LinkedHashMap<String, dynamic> deepCopy(Map<String, dynamic> source) {
  return json.decode(json.encode(source));
}

void printLongString(String longString) {
  const chunkSize = 800;
  for (var i = 0; i < longString.length; i += chunkSize) {
    var end =
        (i + chunkSize < longString.length) ? i + chunkSize : longString.length;
    print(longString.substring(i, end));
  }
}

int get_random_int(int max) {
  int rng = Random().nextInt(max);
  return rng;
}
