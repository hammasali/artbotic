class StylesModel {
  StylesModel({
    this.modelId,
    this.modelName,
    this.drawable,
  });

  StylesModel.fromJson(dynamic json) {
    modelId = json['model_id'];
    modelName = json['model_name'];
    drawable = json['drawable'];
  }

  String? modelId;
  String? modelName;
  String? drawable;
}
