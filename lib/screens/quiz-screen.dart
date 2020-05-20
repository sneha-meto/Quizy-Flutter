import 'package:flutter/material.dart';
import 'package:quizyflutter/screens/results-screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../option-card.dart';
import 'package:toast/toast.dart';

class QuizScreen extends StatefulWidget {
  final dynamic qBankStore;
  QuizScreen({this.qBankStore});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String que;
  String opt1, opt2, opt3, opt4;
  int qNo = 0;
  int score = 0;
  int ans = 9;
  int selectedRadio = 5;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    setState(() {
      if (widget.qBankStore == null) {
        que = 'Unable to retrieve question, please check your network.';
        opt1 = 'null';
        opt2 = 'null';
        opt3 = 'null';
        opt4 = 'null';
        return;
      }

      que = widget.qBankStore['Quiz Questions'][qNo]['Questions'].toString();
      opt1 = widget.qBankStore['Quiz Questions'][qNo]['Answers'][0]['Answers']
          .toString();
      opt2 = widget.qBankStore['Quiz Questions'][qNo]['Answers'][1]['Answers']
          .toString();
      opt3 = widget.qBankStore['Quiz Questions'][qNo]['Answers'][2]['Answers']
          .toString();
      opt4 = widget.qBankStore['Quiz Questions'][qNo]['Answers'][3]['Answers']
          .toString();
    });
  }

  void updateQues() {
    setState(() {
      if (qNo == widget.qBankStore['Quiz Questions'].length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultsScreen(
                      score: score,
                      total: widget.qBankStore['Quiz Questions'].length,
                    )));
        return;
      } else {
        qNo++;
      }
    });
  }

  void checkAnswer(int opt) {
    if (widget.qBankStore['Quiz Questions'][qNo]['Answers'][opt]['isTrue']
            .toString() ==
        'true') score++;
  }

  void setRadio(value) {
    setState(() {
      selectedRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/quiz.png'))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Question ${qNo + 1}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.5),
                        )
                      ],
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.pink[50]),
                ),
                LinearPercentIndicator(
                  //animateFromLastPercent: true,
                  lineHeight: 30,
                  percent:
                      (qNo + 1) / widget.qBankStore['Quiz Questions'].length,
                  backgroundColor: Colors.white.withOpacity(0.4),
                  linearGradient: LinearGradient(
                      colors: [Colors.pink[300], Colors.pink[100]]),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          que,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1,
                            color: Colors.deepPurple,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        OptionCard(
                          opt: opt1,
                          grpVal: selectedRadio,
                          radioVal: 0,
                          onTap: () {
                            setRadio(0);
                            ans = 0;
                          },
                        ),
                        OptionCard(
                          opt: opt2,
                          grpVal: selectedRadio,
                          radioVal: 1,
                          onTap: () {
                            setRadio(1);
                            ans = 1;
                          },
                        ),
                        OptionCard(
                          opt: opt3,
                          onTap: () {
                            setRadio(2);
                            ans = 2;
                          },
                          grpVal: selectedRadio,
                          radioVal: 2,
                        ),
                        OptionCard(
                          opt: opt4,
                          grpVal: selectedRadio,
                          radioVal: 3,
                          onTap: () {
                            setRadio(3);
                            ans = 3;
                          },
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(15, 15),
                          blurRadius: 30,
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white.withOpacity(0.8),
                    )),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 90,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (ans == 9) {
                        Toast.show('Please select an option.', context,
                            backgroundColor: Colors.deepPurple,
                            gravity: Toast.CENTER);
                        return;
                      }
                      checkAnswer(ans);
                      updateQues();
                      updateUI();
                      selectedRadio = 5;
                      ans = 9;
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45.withOpacity(0.5),
                                offset: Offset(5, 5),
                                blurRadius: 10,
                              )
                            ]),
                        child: Text('Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
