

import 'package:flutter/material.dart';
import 'package:quizapp/model.dart';


class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  List quizapp = [
    Questions(question: "Sharks are mammals", answer: true),
    Questions(question: "The hummingbird egg is the world's smallest bird egg",
        answer: true),
    Questions(question: "A dog sweats by panting its tongue", answer: false),
    Questions(
        question: "The blue whale is the biggest animal to have ever lived",
        answer: true),
    Questions(question: "Bats are blind.", answer: false),
    Questions(question: "Galapagos tortoises sleep up to 16 hours a day",
        answer: true),
    Questions(
        question: "An ant can lift 1,000 times its body weight", answer: false),
    Questions(question: "An octopus has seven hearts", answer: false),
    Questions(
        question: "It takes a sloth two weeks to digest a meal", answer: true),
    Questions(
        question: "The goat is the national animal of Scotland", answer: false),
  ];
  int _questionNumber = 0;

  String getQuestion() {
    return quizapp[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return quizapp[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < quizapp.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= quizapp.length - 1) {
      return true;
    }
    else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
    count = 0;
    count1 = 0;
    qnum = 0;
    icon = [];
  }

  List<IconData> icon = [];
  int qnum = 0;
  int count = 0;
  int count1 = 0;

  void ansQn(bool answer) {

    bool getanswer = getQuestionAnswer();
    setState(() {
      if (getanswer == answer) {
        icon.add(Icons.check);
        count++;
      } else {
        icon.add(Icons.close);
        count1++;
      }
      if (count >= 5) {
        openAlertWin();
        reset();
        icon = [];
      } else if (count1 >= 5) {
        openAlertFail();
        reset();
        icon = [];
      } else {
        nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 5,
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                child:
                Center(
                  child: Text(
                    getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ),),),

            SizedBox(height: 20, width: 30,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ansQn(true);
                });
              },
              child: const Text('True', style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 185, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  primary: Colors.green[500]
              ),
            ),
            SizedBox(width: 20, height: 20,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ansQn(false);
                });
              },
              child: const Text('False', style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 185, vertical: 20),
                  backgroundColor: Colors.red[500],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12),
              child: Row(
                children: [
                  for (var iconData in icon)
                    Icon(iconData, color: Colors.green[800], size: 35),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  void openAlertWin() {
    showDialog(
      context: context, builder: (context) =>
        AlertDialog(
          title: Text('Congratulations!',
            style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text('You answered at least 5 questions correctly.'),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            },
              child: Text('OK', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
    );
  }

  void openAlertFail() {
    showDialog(
      context: context, builder: (context) =>
        AlertDialog(
          title: Text('Sorry!',
            style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text('You answered more than 5 questions incorrectly'),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            },
              child: Text('OK', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
    );
  }
}