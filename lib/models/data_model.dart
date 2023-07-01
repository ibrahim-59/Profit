class receipeModel {
  String? image, url, source, label;
  List<dynamic> ingredients;
  int? count;
  double? protin, calories, fat, carb;
  receipeModel(
      {this.image,
      this.url,
      this.source,
      this.label,
      this.protin,
      this.calories,
      this.fat,
      this.carb,
      this.count,
      required this.ingredients});
}

class receipe {
  String? image, url, source, label;
  List<dynamic> ingredients;
  int? protin, calories, fat, carb;
  receipe(
      {this.image,
      this.source,
      this.label,
      this.protin,
      this.calories,
      this.fat,
      this.carb,
      required this.ingredients});
}

class foodModel {
  final String food1,
      status1,
      food2,
      status2,
      food3,
      status3,
      food4,
      status4,
      food5,
      status5,
      food6,
      status6;
  foodModel({
    required this.food1,
    required this.status1,
    required this.food2,
    required this.status2,
    required this.food3,
    required this.status3,
    required this.food4,
    required this.status4,
    required this.food5,
    required this.status5,
    required this.food6,
    required this.status6,
  });
}
