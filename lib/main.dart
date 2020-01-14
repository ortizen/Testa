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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: _background.evaluate(AlwaysStoppedAnimation(_controller.value)),
      ),
      child: Stack(
        children: [
          RotationTransition(
            turns: _controller,
            alignment: Alignment.center,
            child: Image.network(
                'https://png2.cleanpng.com/sh/96cbb63993c09a5c985b0d49a808aa20/L0KzQYm3UsE1N5JxiZH0aYP2gLBuTfZwd6Vned51LXPvecG0ggJ1NaR0e9Vucj3lcb3zTf92fJ1uhtc2NXG7RImBVcUybJc6S6U3MEC8RIaBVsIyPWI9TqUAMEm2QYO5V75xdpg=/kisspng-football-clip-art-soccer-ball-outline-5a8488551df533.0094586215186350931227.png'),
          ),
          ScaleTransition(
            alignment: Alignment.center,
            scale: _controller,
            child: ScaleTransition(
              alignment: Alignment.center,
              scale: _controller,
              child: Image.network(
                  'https://www.netclipart.com/pp/m/15-150942_hourglass-half-icons-transparent-background-hour-glass-clipart.png'),
            ),
          ),
        ],
      ),
    );
  }
}
