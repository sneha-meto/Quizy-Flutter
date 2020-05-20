import 'package:flutter/material.dart';
import 'package:quizyflutter/questions.dart';
import 'package:quizyflutter/screens/quiz-screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final Questions questions = Questions();
  AnimationController controller;

  Future getData() async {
    var qBankStore = await questions.grabQuestions();
    return qBankStore;
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/quiz9.png'), fit: BoxFit.fill)),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Quizy',
                style: TextStyle(
                  letterSpacing: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(5, 5),
                      color: Colors.white.withOpacity(0.4),
                    )
                  ],
                ),
              ),
              Container(
                height: 205,
                width: 217,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/home.png'),
                        fit: BoxFit.cover)),
              ),
              GestureDetector(
                onTap: () async {
                  var data = await getData();
                  print(data);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizScreen(
                                qBankStore: data,
                              )));
                },
                child: Transform.scale(
                  scale: 1 + 0.1 * controller.value,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: Text('Begin',
                          style: TextStyle(
                              color: Colors.deepPurple, fontSize: 25))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
