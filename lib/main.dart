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
  Animatable<Color> _background = TweenSequence<Color>(
    [
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.red,
          end: Colors.green,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.blue,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.blue,
          end: Colors.pink,
        ),
      ),
    ],
  );

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    )..addListener(() => setState(() {}));

    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color:
                _background.evaluate(AlwaysStoppedAnimation(_controller.value)),
          ),
          child: Stack(
            children: [
              RotationTransition(
                turns: _controller,
                alignment: Alignment.center,
                child: Image.asset('assets/images/ball_soccer.png'),
              ),
              ScaleTransition(
                alignment: Alignment.center,
                scale: _controller,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: _controller,
                  child: Image.asset('assets/images/hour_glass.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
