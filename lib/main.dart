import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: RotatingBall(),
    );
  }
}

class RotatingBall extends StatefulWidget {
  @override
  _RotatingBallState createState() => _RotatingBallState();
}

class _RotatingBallState extends State<RotatingBall>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..addListener(() => setState(() {}));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RotationTransition(
        turns: _animation,
        child: Transform(
            transform: Matrix4.translationValues(50.0, 50.0, 0.0),
            child: Image.asset('assets/images/ball.png')),
      ),
    );
  }
}
