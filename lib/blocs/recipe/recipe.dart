import 'dart:convert';

class Recipe {
  String name;
  List<String> ingredients;

  Recipe({required this.name, this.ingredients = const []});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ingredients': ingredients,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'] ?? '',
      ingredients: List<String>.from(map['ingredients']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));
}
