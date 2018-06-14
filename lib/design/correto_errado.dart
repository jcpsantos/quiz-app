import 'dart:math';
import 'package:flutter/material.dart';

class CorretoErrado extends StatefulWidget {

  final bool _isCorreto;
  final VoidCallback _onTap;

  CorretoErrado(this._isCorreto, this._onTap);

  @override
  State createState() => new CorretoErradoState();
}

class CorretoErradoState extends State<CorretoErrado> with SingleTickerProviderStateMixin {

  Animation<double> _iconeAnimation;
  AnimationController _iconeAnimationController;

  @override
  void initState() {
    super.initState();
    _iconeAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _iconeAnimation = new CurvedAnimation(parent: _iconeAnimationController, curve: Curves.elasticOut);
    _iconeAnimation.addListener(() => this.setState(() {}));
    _iconeAnimationController.forward();
  }

  @override
  void dispose() {
    _iconeAnimationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                angle: _iconeAnimation.value * 2 * PI,
                child: new Icon(widget._isCorreto == true ? Icons.done : Icons.clear, size: _iconeAnimation.value * 80.0,),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorreto == true ? "Correro! Parabéns" : "Errado! Que Pena", style: new TextStyle(color: Colors.white, fontSize: 25.0),)
          ],
        ),
      ),
    );
  }
}