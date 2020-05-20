import 'package:flutter/material.dart';
import 'package:quizyflutter/comment.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int total;
  ResultsScreen({this.score, this.total});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/quiz3.png'))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'You Scored',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            color: Colors.deepPurple,
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '$score/$total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            color: Colors.deepPurple,
                            fontSize: 50,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          Comment().getComment(score, total),
                          style: TextStyle(
                            height: 1.3,
                            color: Colors.deepPurple,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
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
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: Text('Try Again',
                          style: TextStyle(
                              color: Colors.deepPurple, fontSize: 25))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
