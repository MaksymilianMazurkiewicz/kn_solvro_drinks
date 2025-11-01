import './../ingredients/ingredients.dart';

class BaseDrink {
  int id;
  String name;
  String category;
  String glass;
  String instructions;
  String imageUrl;
  bool alcoholic;
  String createdAt;
  String updatedAt;
  
  BaseDrink({
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

  factory BaseDrink.fromJson(Map<String, dynamic> json) {
    return BaseDrink(
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

class ExtendDrink extends BaseDrink {
  List<Ingredients> ingredients;

  ExtendDrink({required super.id, required super.name, required super.category, required super.glass, required super.instructions, required super.imageUrl, required super.alcoholic, required super.createdAt, required super.updatedAt, required this.ingredients});

  factory ExtendDrink.fromJson(Map<String, dynamic> json) {
    return ExtendDrink(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      glass: json['glass'],
      instructions: json['instructions'],
      imageUrl: json['imageUrl'],
      alcoholic: json['alcoholic'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      ingredients: List<Ingredients>.from(json['ingredients'].map((item) => Ingredients.fromJson(item))),
    );
  }
}