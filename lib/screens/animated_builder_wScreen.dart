import 'package:flutter/material.dart';
import 'dart:math' as math;


class AnimatedBuilderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Builder'),
      ),
      body: Center(
        child: Spinner(),
        
      ),
    );
  }
}


class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AnimatedBuilder(
          animation: _controller,
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
            child: const Center(
              child: Text('Spinner using \nanimated builder'),
            ),
          ),
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: child,
            );
          },
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              onPressed: (){
                _controller..repeat();
               
              }, 
              icon: Icon(Icons.rotate_90_degrees_ccw), 
              label: Text('Spin'),
            ),
            FlatButton.icon(
              onPressed: (){
              
                if(_controller.isAnimating){
                  _controller.stop();
                }
              
              }, 
              icon: Icon(Icons.stop), 
              label: Text('Stop'),
            )
          ],
        ),
         
      ],
    );
  }
}