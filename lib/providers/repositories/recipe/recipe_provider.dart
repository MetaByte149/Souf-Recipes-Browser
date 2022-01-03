import 'package:flutter_souf_recipes/blocs/recipe/recipe.dart';
import 'package:flutter_souf_recipes/providers/repositories/recipe/recipe_repository_api.dart';

class RecipeProvider {
  final RecipeRepositoryApi _instance;

  RecipeProvider(this._instance);

  Future<List<Recipe>> getAllRecipes(String userId) async {
    final maps = await _instance.getAllRecipes(userId);
    return maps.map((e) => Recipe.fromMap(e)).toList();
  }
}
