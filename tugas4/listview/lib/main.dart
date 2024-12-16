import 'package:flutter/material.dart';
import 'layout/home/homepage_with_menu.dart';
//import 'GridViewLearning.dart';
//import 'ListsWithCards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      //home: Scaffold(
      //Dibawah ini buat body ListsWithCards!!!!
      //body: ListsWithCards(),

      //body: GridView.builder(
      //padding: const EdgeInsets.all(30),
      //itemCount: 8,
      //gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //crossAxisCount: 2,
      //childAspectRatio: 2 / 2,
      //crossAxisSpacing: 10,
      //mainAxisSpacing: 10),
      //itemBuilder: (ctx, i) => GridViewLearning())),
    );
  }
}
