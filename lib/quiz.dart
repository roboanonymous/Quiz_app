import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questionscreen.dart';


class Quiz extends StatefulWidget {
  
  const Quiz ({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  } 
}

class _QuizState extends State<Quiz> {

   var activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questionscreen';
    });

  }

  @override
  Widget build(context){
    final screenwidget = activeScreen == 'start_screen'
              ? StartScreen(switchScreen)
              : const QuestionScreen();
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
          child: screenwidget,
        ),
      ),
    );
  }
}