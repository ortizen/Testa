import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
      duration: Duration(seconds: 15),
    )
      ..repeat()
      ..addListener(() => setState(() {}));

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
    return Stack(
      children: [
        RotationTransition(
          turns: _animation,
          alignment: Alignment.center,
          child: Image.asset('assets/images/ball.png'),
        ),
        ScaleTransition(
          alignment: Alignment.center,
          scale: _controller,
          child: ScaleTransition(
            alignment: Alignment.center,
            scale: _controller,
            child: Image.asset(''),
          ),
        ),
      ],
    );
  }
}
