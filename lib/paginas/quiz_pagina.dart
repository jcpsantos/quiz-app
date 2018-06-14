import 'package:flutter/material.dart';

import '../modelos/questao.dart';
import '../modelos/quiz.dart';

import '../design/button_resposta.dart';
import '../design/questao_texto.dart';
import '../design/correto_errado.dart';

import './score_pagina.dart';

class QuizPagina extends StatefulWidget {
  @override
  State createState() => new QuizPaginaState();
}

class QuizPaginaState extends State<QuizPagina> {

  Questao questaoAtual;
  Quiz quiz = new Quiz([
    new Questao("Han Solo é o pai de Luke", false),
    new Questao("Homem-Aranha é da DC", false),
    new Questao("Wolverine possui o fator de cura", true)
  ]);
  String questaoTexto;
  int questaoNumber;
  bool isCorreto;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    questaoAtual = quiz.proximaQuestao;
    questaoTexto = questaoAtual.questao;
    questaoNumber = quiz.questaoNumber;
  }

  void handleAnswer(bool answer) {
    isCorreto = (questaoAtual.resposta == answer);
    quiz.resposta(isCorreto);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // This is our main page
          children: <Widget>[
            new ButtonResposta(true, () => handleAnswer(true)), //true button
            new QuestaoTexto(questaoTexto, questaoNumber),
            new ButtonResposta(false, () => handleAnswer(false)), // false button
          ],
        ),
        overlayShouldBeVisible == true ? new CorretoErrado(
          isCorreto,
          () {
            if (quiz.quant == questaoNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePagina(quiz.score, quiz.quant)), (Route route) => route == null);
              return;
            }
            questaoAtual = quiz.proximaQuestao;
            this.setState(() {
              overlayShouldBeVisible = false;
              questaoTexto = questaoAtual.questao;
              questaoNumber = quiz.questaoNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}