// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc_state.dart';
import 'package:flutter_souf_recipes/providers/mocks/recipe_provider.dart';
import 'package:flutter_souf_recipes/providers/repositories/recipe/recipe_provider.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = Faker();

    // Providers
    final recipeProvider =
        RecipeProvider(MockRecipeProvider(fakerGenerator: faker));

    // Blocs
    final recipeBloc = RecipeBloc(context, recipeProvider);

    return MultiRepositoryProvider(
      key: key,
      providers: [
        RepositoryProvider<RecipeProvider>(
          create: (_) => recipeProvider,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => recipeBloc),
        ],
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text("App title"),
            ),
            body: Column(
              children: [
                const Text("Hello there"),
                BlocBuilder<RecipeBloc, RecipeBlocState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        for (var element in state.loadedRecipes)
                          Text(element.name)
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
