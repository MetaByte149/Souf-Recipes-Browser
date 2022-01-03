import 'package:flutter_souf_recipes/blocs/recipe/recipe.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecipeEvent {}

class FirebaseLoadedEvent extends RecipeEvent {
  final bool firebaseLoaded = true;
}

class NewRecipesFoundEvent extends RecipeEvent {
  final List<Recipe> loadedRecipes = [];
}
