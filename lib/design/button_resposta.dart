import 'package:flutter/material.dart';

class ButtonResposta extends StatelessWidget {

  final bool _resposta;
  final VoidCallback _onTap;

  ButtonResposta(this._resposta, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded( // true button
      child: new Material(
        color: _resposta == true ? Colors.lightGreen: Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 5.0)
              ),
              padding: new EdgeInsets.all(20.0),
              child: new Text(_resposta == true ? "Verdade" : "Falso",
                style: new TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
              ),
            )
          ),
        ),
      ),
    );
  }
}