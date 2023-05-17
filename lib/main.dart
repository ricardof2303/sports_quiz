import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quiz/helper.dart';

Helper helper = Helper();

void main() => runApp(const QuizzApp());

class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('SPORTS QUIZ'),
          centerTitle: true,
          elevation: 15,
          toolbarHeight: 100,
        ),
        backgroundColor: Colors.limeAccent,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> marcadorDePontos = [];

  void conferirResposta(bool respostaSelecionadaPeloUsuario) {
    bool respostaCerta = helper.obterRespostaCorreta();

    setState(() {
      if (helper.confereFimDaExecucao() == true) {
        Alert(
          context: context,
          title: 'Chegamos ao Fim!',
          desc: 'Parabéns! Você respondeu todas as perguntas.',
        ).show();
        helper.resetarQuiz();
        marcadorDePontos = [];
      } else {
        if (respostaSelecionadaPeloUsuario == respostaCerta) {
          marcadorDePontos.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          marcadorDePontos.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        helper.proximaPergunta();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.obterQuestao(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                conferirResposta(true);
              },
              child: const Text(
                'Verdadeiro',
                style: TextStyle(color: Colors.green, fontSize: 30.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                conferirResposta(false);
              },
              child: const Text(
                'Falso',
                style: TextStyle(color: Colors.green, fontSize: 30.0),
              ),
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        )
      ],
    );
  }
}
