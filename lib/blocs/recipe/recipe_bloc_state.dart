import 'package:flutter_souf_recipes/blocs/recipe/recipe.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecipeBlocState {
  final bool firebaseLoaded = false;
  final List<Recipe> loadedRecipes = [];
}

class StateA extends RecipeBlocState {}

class StateB extends RecipeBlocState {}
