import 'package:equatable/equatable.dart';
import 'package:flutter_souf_recipes/data/database_status.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe.dart';

class RecipeBlocState extends Equatable {
  final DatabaseStatus databaseStatus;
  final List<Recipe> loadedRecipes;

  const RecipeBlocState({
    this.databaseStatus = DatabaseStatus.pending,
    this.loadedRecipes = const [],
  });

  @override
  List<Object> get props {
    return [
      databaseStatus,
      loadedRecipes,
    ];
  }

  RecipeBlocState copyWith({
    DatabaseStatus? databaseStatus,
    List<Recipe>? loadedRecipes,
  }) {
    return RecipeBlocState(
      databaseStatus: databaseStatus ?? this.databaseStatus,
      loadedRecipes: loadedRecipes ?? this.loadedRecipes,
    );
  }
}
