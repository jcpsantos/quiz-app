import 'package:flutter/material.dart';

class QuestaoTexto extends StatefulWidget {

  final String _questao;
  final int _questaoNumber;

  QuestaoTexto(this._questao, this._questaoNumber);

  @override
  State createState() => new QuestaoTextoState();
}

class QuestaoTextoState extends State<QuestaoTexto> with SingleTickerProviderStateMixin {

  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestaoTexto oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._questao != widget._questao) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text("Pergunta " + widget._questaoNumber.toString() + ": " + widget._questao,
            style: new TextStyle(fontSize: _fontSizeAnimation.value * 15),
          ),
        )
      ),
    );
  }
}