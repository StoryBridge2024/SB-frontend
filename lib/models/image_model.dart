class ImageResponse {
  final int created;
  List<dynamic> data;

  ImageResponse.fromJson(Map<String, dynamic> json)
      : created = json['created'],
        data = json['data']?? (throw ArgumentError('data cannot be null'));
}
