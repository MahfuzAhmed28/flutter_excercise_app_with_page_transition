import 'package:flutter/material.dart';
import 'package:flutter_excercise_app_with_page_transition/dashboard.dart';
import 'package:flutter_excercise_app_with_page_transition/home_screen.dart';

class ExerciseAppUi extends StatefulWidget {
  const ExerciseAppUi({super.key});

  @override
  State<ExerciseAppUi> createState() => _ExerciseAppUiState();
}

class _ExerciseAppUiState extends State<ExerciseAppUi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
