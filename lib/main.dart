import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc.dart';
import 'package:flutter_souf_recipes/blocs/recipe/recipe_bloc_state.dart';

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
    return MaterialApp(
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
                return const Text("");
              },
            )
          ],
        ),
      ),
    );
  }
}
