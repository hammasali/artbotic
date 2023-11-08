class UpscaleModel {
  final bool faceEnhance;
  final int scale;
  final String imageUrl;
  final String webhook;
  final String firebaseToken;
  final String endpoint;

  UpscaleModel(
      {required this.faceEnhance,
      required this.scale,
      required this.imageUrl,
      required this.firebaseToken,
      required this.endpoint,
      required this.webhook});

  Map<String, dynamic> toJson() => {
        'face_enhance': faceEnhance,
        'scale': scale,
        'url': imageUrl,
        'webhook': webhook,
        'token': firebaseToken,
        'endpoint': endpoint,
      };
}
