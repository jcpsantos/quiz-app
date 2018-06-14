import 'package:flutter/material.dart';
import './quiz_pagina.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.lightBlue,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPagina())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Geek Quiz!!!!", style: new TextStyle(color: Colors.red, fontSize: 50.0, fontWeight: FontWeight.bold),),
            new Text("Aperte para começar!", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}