abstract class RecipeRepositoryApi {
  Future<List<Map<String, dynamic>>> getAllRecipes(String userId);
}
