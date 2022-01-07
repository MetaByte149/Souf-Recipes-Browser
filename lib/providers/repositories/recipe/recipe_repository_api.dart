abstract class RecipeRepositoryApi {
  Future<List<Map<String, dynamic>>> getAllRecipesFromUser(String userId);
  Stream<List<Map<String, dynamic>>> listRecipesOfUser(String userId);
}
