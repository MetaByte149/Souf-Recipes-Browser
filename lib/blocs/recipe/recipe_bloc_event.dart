import 'package:equatable/equatable.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecipeEvent extends Equatable {}

class NewRecipesFoundEvent extends RecipeEvent {
  final List<Recipe> loadedRecipes;

  NewRecipesFoundEvent(this.loadedRecipes);

  @override
  List<Object> get props => [loadedRecipes];
}
