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

   Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchscreen);
    super.initState();
  }

  void switchscreen(){
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(context){
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
          child: activeScreen,
        ),
      ),
    );
  }
}