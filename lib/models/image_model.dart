class ImageResponse {
  final int created;
  List<dynamic> data;

  ImageResponse.fromJson(Map<String, dynamic> json)
      : created =
            json['created'] ?? (throw ArgumentError('created cannot be null')),
        data = json['data'] ?? (throw ArgumentError('data cannot be null'));
}
