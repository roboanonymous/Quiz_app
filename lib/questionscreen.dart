import 'package:flutter/material.dart';
import 'package:quiz_app/answerbutton.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({
    super.key, 
    required this.onselectAnswer,
    });

  final void Function(String answer) onselectAnswer;

  @override
  State <QuestionScreen> createState() {
    return _QuestionScreenState();
  }

}

class _QuestionScreenState extends State<QuestionScreen>{

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){

    widget.onselectAnswer(selectedAnswer);

    setState(() {
       currentQuestionIndex++;
    });
   
  }

  @override
  Widget build(BuildContext context) {
    final currentques = questions[currentQuestionIndex];

    return SizedBox(
        width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                currentques.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 199, 156, 234),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentques.shuffleanswer().map((answer){
                return AnswerButton(
                  answerText: answer, onTap:() {
                    answerQuestion(answer);
                    }
                    );
              }  )
        ],   
        ),
      ),
    );
  }



}