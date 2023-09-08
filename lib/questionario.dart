import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final void Function() responder;
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;

  const Questionario({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];
    //se tem perguntaSelecionada então vou pegar as respostas da pergunta, se ão retorna lista vazio

    return Column(
      children: <Widget>[
        //lista de Widgets
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        // Resposta('Resposta 1', _responder),
        // Resposta('Resposta 2', _responder),
        // Resposta('Resposta 3', _responder),
        ...respostas
            .map((resp) => Resposta(resp['texto'] as String, responder))
            .toList(),
        //Peguei as respostas que é uma lista de string,usei o map para converter a lista de string em lista de widgets,
        //e tranformei o resultado do map m uma lista, dai usei o  "spread operator" ou "operador de propagação" (...)
        //para pegar cada um dos elementos da lista e joga na  lista onde tem os filhos da Column
      ],
    );
  }
}
