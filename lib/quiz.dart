import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questionscreen.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  
  const Quiz ({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizState();
  } 
}

class _QuizState extends State<Quiz> {
  List <String> selectedAnswer = [];
   var activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questionscreen';
    });

  }

    void chooseAnswer(String answer){
      selectedAnswer.add(answer);

      if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questionscreen') {
      screenWidget = QuestionScreen(
        onselectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswer: selectedAnswer,
      );
    }

    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}