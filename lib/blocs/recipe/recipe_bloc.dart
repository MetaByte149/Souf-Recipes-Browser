import 'package:bloc/bloc.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc_event.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeBlocState> {
  RecipeBloc() : super(StateA()) {
    on<FirebaseLoadedEvent>((event, emit) => emit(StateA()));
    on<NewRecipesFoundEvent>((event, emit) => emit(StateB()));
  }
}
