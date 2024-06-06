import 'dart:convert';

Map<String, dynamic> deepCopy(Map<String, dynamic> source) {
  return json.decode(json.encode(source));
}