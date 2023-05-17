import 'perguntas.dart';

class Helper {
  int _numeroDaQuestaoAtual = 0;

  // ignore: prefer_final_fields
  List<Perguntas> _bancoDePerguntas = [
    Perguntas(
        'Portugal foi o campeão do campeonato mundial de futebol de 2014.',
        false),
    Perguntas('Porto é o time famoso conhecido como os vermelhos.', false),
    Perguntas(
        'Real Madrid e Atlético de Madrid são os times espanhóis que estrelam o chamado Classic.',
        false),
    Perguntas(
        'Edinson Cavani marcou os dois golos do Uruguai que ditaram o afastamento de Portugal da copa em 2018.',
        true),
    Perguntas(
        'A FIFA é a instituição que governa as federações de futebol ao redor do planeta.',
        true),
    Perguntas(
        '58 é o número de jogos consecutivos que esteve o FC Porto sem derrotas na I Liga.',
        true),
    Perguntas(
        'Quem colocou um ponto final a esta série de invencibilidade do Porto no campeonato foi o Braga.',
        true),
    Perguntas(
        'Mais de 90% de todos os títulos do FC Porto foram conquistados com Pinto da Costa a presidente.',
        false),
    Perguntas('No ano de 1950 foi fundado o Sporting.', false),
    Perguntas('O Benfica é o maior rival do Sporting Clube de Portugal.', true),
    Perguntas('Estádio do dragão é o nome do estadio do Sporting.', false),
    Perguntas(
        'Dragões versos leões é como é conhecido o classíco entre Sporting e Porto.',
        true),
    Perguntas(
        'Eusebio é que foi o melhor marcador de sempre do SLB (Sport Lisboa e Benfica).',
        true),
    Perguntas('Quaresma jogou no Benfica.', false),
    Perguntas('O Flamengo é o maior e melhor time de futebol do Brasil.', true),
  ];

  void proximaPergunta() {
    if (_numeroDaQuestaoAtual < _bancoDePerguntas.length - 1) {
      _numeroDaQuestaoAtual++;
    }
    //print(_numeroDaQuestaoAtual);
    //print(_bancoDePerguntas.length);
  }

  String obterQuestao() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].questao;
  }

  bool obterRespostaCorreta() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].respostaDaQuestao;
  }

  confereFimDaExecucao() {
    if (_numeroDaQuestaoAtual >= _bancoDePerguntas.length - 1) {
      //print('Chegou na última pergunta do quiz');
      return true;
    } else {
      return false;
    }
  }

  resetarQuiz() {
    _numeroDaQuestaoAtual = 0;
  }
}
