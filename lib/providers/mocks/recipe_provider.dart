import 'package:flutter_souf_recipes/blocs/recipe/recipe.dart';
import 'package:flutter_souf_recipes/providers/repositories/recipe/recipe_repository_api.dart';

class MockRecipeProvider extends RecipeRepositoryApi {
  MockRecipeProvider();

  @override
  Future<List<Map<String, dynamic>>> getAllRecipes(String userId) async {
    final List<Recipe> testRecipes = [
      Recipe(name: "Apple"),
      Recipe(name: "Banana"),
      Recipe(name: "Kiwi"),
    ];

    await Future.delayed(const Duration(seconds: 5));

    return testRecipes.map((element) => element.toMap()).toList();
  }
}
