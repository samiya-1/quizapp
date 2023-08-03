import 'package:flutter/material.dart';

class Questions {
  late String question;
  late bool answer;

  Questions({required this.question, required this.answer});

}
class Functions extends StatefulWidget {
  const Functions({super.key});

  @override
  State<Functions> createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions> {
  late int _questionNumber;
  List quizapp=[
    Questions(question:"1.Sharks are mammals",answer:true),
    Questions(question:"2.The hummingbird egg is the world's smallest bird egg",answer:true),
    Questions(question:"3.A dog sweats by panting its tongue",answer:false),
    Questions(question:"4.The blue whale is the biggest animal to have ever lived",answer:true),
    Questions(question:"5.Bats are blind.",answer:false),
    Questions(question:"6.Galapagos tortoises sleep up to 16 hours a day",answer:true),
    Questions(question:"7.An ant can lift 1,000 times its body weight",answer:false),
    Questions(question:"8.An octopus has seven hearts",answer:false),
    Questions(question:"9.It takes a sloth two weeks to digest a meal",answer:true),
    Questions(question:"10.The goat is the national animal of Scotland",answer:false),
  ];
  String getQuestion() {
    return quizapp[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return quizapp[_questionNumber].answer;
  }
  void nextQuestion() {
    if (_questionNumber < quizapp.length - 1)
    {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= quizapp.length - 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  void reset()
  {
    _questionNumber = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
