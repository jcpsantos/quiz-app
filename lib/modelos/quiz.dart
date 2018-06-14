import './questao.dart';

class Quiz {
  List<Questao> _questoes;
  int _questaoAtualIndex = -1;
  int _score = 0;

  Quiz(this._questoes) {
    _questoes.shuffle();
  }

  List<Questao> get questoes => _questoes;
  int get quant => _questoes.length;
  int get questaoNumber => _questaoAtualIndex+1;
  int get score => _score;

  Questao get proximaQuestao {
    _questaoAtualIndex++;
    if (_questaoAtualIndex >= quant) return null;
    return _questoes[_questaoAtualIndex];
  }

  void resposta(bool isCorreto) {
    if (isCorreto) _score++;
  }
}