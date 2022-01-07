import 'package:faker/faker.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe.dart';
import 'package:flutter_souf_recipes/providers/repositories/recipe/recipe_repository_api.dart';

class MockRecipeProvider extends RecipeRepositoryApi {
  final Faker fakerGenerator;

  MockRecipeProvider({required this.fakerGenerator});

  @override
  Future<List<Map<String, dynamic>>> getAllRecipesFromUser(
      String userId) async {
    final List<Recipe> testRecipes = [
      Recipe(name: fakerGenerator.food.dish()),
      Recipe(name: fakerGenerator.food.dish()),
      Recipe(name: fakerGenerator.food.dish()),
    ];

    await Future.delayed(const Duration(seconds: 5));

    return testRecipes.map((element) => element.toMap()).toList();
  }

  @override
  Stream<List<Map<String, dynamic>>> listRecipesOfUser(
    String userId, {
    int amountOfRecipes = 5,
  }) {
    final List<Map<String, dynamic>> testRecipes = [];
    final List<Future<List<Map<String, dynamic>>>> futures = [];

    for (int i = 0; i < amountOfRecipes; i++) {
      testRecipes.add(Recipe(name: fakerGenerator.food.dish()).toMap());

      futures.add(Future.delayed(
          Duration(seconds: i * 2), () => testRecipes.take(i).toList()));
    }

    return Stream.fromFutures(futures);
  }
}
