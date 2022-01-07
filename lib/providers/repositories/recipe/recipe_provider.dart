import 'package:flutter_souf_recipes/blocs/recipe/recipe.dart';
import 'package:flutter_souf_recipes/providers/repositories/recipe/recipe_repository_api.dart';

class RecipeProvider {
  final RecipeRepositoryApi _instance;

  RecipeProvider(this._instance);

  Future<List<Recipe>> getAllRecipesFromUser(String userId) async {
    final rawData = await _instance.getAllRecipesFromUser(userId);
    return rawData.map((e) => Recipe.fromMap(e)).toList();
  }

  Stream<List<Recipe>> listRecipesOfUser(String userId) {
    final rawStream = _instance.listRecipesOfUser(userId);

    return rawStream
        .map((event) => event.map((event) => Recipe.fromMap(event)).toList());
  }
}
