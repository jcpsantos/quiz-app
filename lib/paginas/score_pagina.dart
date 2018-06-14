import 'package:flutter/material.dart';

import './landing_page.dart';

class ScorePagina extends StatelessWidget {

  final int score;
  final int totalQuestao;

  ScorePagina(this.score, this.totalQuestao);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.orangeAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Seu Score: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
          new Text(score.toString() + "/" + totalQuestao.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null)
          )
        ],
      )
    );
  }
}