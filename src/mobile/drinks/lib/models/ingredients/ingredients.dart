class Ingredients {
  int id;
  String? name;
  String? description;
  bool alcohol;
  String? type;
  int? percentage;
  String? imageUrl;
  String measure;

  Ingredients({
    required this.id,
    this.name,
    this.description,
    required this.alcohol,
    this.type,
    this.percentage,
    this.imageUrl,
    required this.measure,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      alcohol: json['alcohol'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      percentage: json['percentage'],
      measure: json['measure'],
    );
  }
}
