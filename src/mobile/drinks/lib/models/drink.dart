class Drink {
  int id;
  String name;
  String category;
  String glass;
  String instructions;
  String imageUrl;
  bool alcoholic;
  String createdAt;
  String updatedAt;
  
  Drink({
    required this.id,
    required this.name,
    required this.category,
    required this.glass,
    required this.instructions,
    required this.imageUrl,
    required this.alcoholic,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      glass: json['glass'],
      instructions: json['instructions'],
      imageUrl: json['imageUrl'],
      alcoholic: json['alcoholic'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}