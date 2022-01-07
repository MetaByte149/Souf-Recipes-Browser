import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc_event.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc_state.dart';
import 'package:flutter_souf_recipes/providers/repositories/recipe/recipe_provider.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeBlocState> {
  final RecipeProvider _recipeProvider;

  StreamSubscription? _recipeSubscription;

  RecipeBloc(BuildContext context, this._recipeProvider)
      : super(const RecipeBlocState()) {
    on<NewRecipesFoundEvent>((event, emit) =>
        emit(state.copyWith(loadedRecipes: event.loadedRecipes)));

    _initialize();
  }

  Future<void> _initialize() async {
    _recipeSubscription = _recipeProvider
        .listRecipesOfUser("TODO use actual name")
        .listen((recipes) {
      add(NewRecipesFoundEvent(recipes));
    });
  }

  @override
  Future<void> close() async {
    await _recipeSubscription?.cancel();

    return super.close();
  }

  @override
  Stream<RecipeBlocState> mapEventToState(
    RecipeEvent event,
  ) async* {
    switch (event.runtimeType) {
      case NewRecipesFoundEvent:
        yield updateNewRecipes(event as NewRecipesFoundEvent);
    }
  }

  RecipeBlocState updateNewRecipes(NewRecipesFoundEvent event) =>
      state.copyWith(loadedRecipes: event.loadedRecipes);
}
