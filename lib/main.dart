// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc_state.dart';
import 'package:flutter_souf_recipes/providers/mocks/recipe_provider.dart';
import 'package:flutter_souf_recipes/providers/repositories/recipe/recipe_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => RecipeBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = RecipeProvider(MockRecipeProvider());

    return MaterialApp(
      home: MultiProvider(
        key: key,
        providers: [
          Provider<RecipeProvider>(
            create: (_) => recipeProvider,
          ),
        ],
        builder: (context, _) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("App title"),
          ),
          body: Column(
            children: [
              const Text("Hello there"),
              BlocBuilder<RecipeBloc, RecipeBlocState>(
                builder: (context, state) {
                  return const Text("");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
