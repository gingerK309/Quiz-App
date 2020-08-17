import 'package:flutter/material.dart';
import 'package:quiz_app/model/model_quiz.dart';
import 'package:quiz_app/screen/screen_home.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizs;
  ResultScreen({this.answers, this.quizs});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height * 1.3;
    int score = 0;
    for (int i = 0; i < quizs.length; i++) {
      if (quizs[i].answer == answers[i]) {
        score += 1;
      }
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('My Quiz App'),
              backgroundColor: Colors.cyan,
              leading: Container(),
              centerTitle: true,
            ),
            body: Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.cyan),
                    color: Colors.cyan,
                  ),
                  width: width * 0.85,
                  height: height * 0.45,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: width * 0.048),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.cyan),
                          color: Colors.white,
                        ),
                        width: width * 0.73,
                        height: height * 0.25,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(0, width * 0.04, 0, 0),
                              child: Text(
                                '당신의 점수는...',
                                style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              score.toString() + '/' + quizs.length.toString(),
                              style: TextStyle(
                                fontSize: width * 0.3,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * 0.015),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: width * 0.048),
                        child: ButtonTheme(
                          minWidth: width * 0.73,
                          height: height * 0.05,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                            },
                            child: Text('홈으로 돌아가기'),
                            color: Colors.white,
                            textColor: Colors.black,
                          ),
                        ),
                      )
                    ],
                  )),
            )),
      ),
    );
  }
}
