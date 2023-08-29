import 'package:flutter/material.dart';
import './questao.dart';

main() => runApp(const PerguntasApp()); // raiz

class PerguntasApp extends StatefulWidget {
  //StatelessWidget = ESTADO imutável dados podem mudar (externamente) --Parâmetros(Dados de Entrada) -- estado constantes -- quandos o parâmetros mudam ele precisa ser renderizado

  // filho

  const PerguntasApp({super.key});

  @override
  State<PerguntasApp> createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  //classe privada, possui o "_"
  var _perguntaSelecionada = 0;
  @override //precisa implementar esse método
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?'
    ];

    void _responder() {
      setState(() {
        _perguntaSelecionada++;
      });
      //O que está sendo modificado
      print(_perguntaSelecionada);
    }

    // void Function() funcaoQueRetornaUmaOutraFuncao() {
    //   return () {
    //     print("Pergunta respondida #02");
    //   };
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Perguntas')),
        ),
        body: Column(
          children: [
            //lista de Widgets
            Questao(texto: perguntas[_perguntaSelecionada]),
            ElevatedButton(
                onPressed: _responder,
                //responder() --chamar a função != responder--função como paramentro do Widget ElevatedButton
                child: const Text('Resposta 1')),
            ElevatedButton(
                onPressed: _responder, child: const Text('Resposta 2')),
            ElevatedButton(
                onPressed: _responder, child: const Text('Resposta 3')),

            // ElevatedButton(
            //     onPressed: funcaoQueRetornaUmaOutraFuncao(),
            //     child: const Text('Resposta 3')),

            // ElevatedButton(
            //     onPressed: (){
            //        print('Pergunta respondida');
            //     },
            //     child: const Text('Resposta 3')),

            // ElevatedButton(
            //     onPressed: () => print('Pergunta respondida');
            //        responder
            //     },
            //     child: const Text('Resposta 3')),

            //  ElevatedButton(
            //     onPressed: null, //desabilitado
            //     child: Text('Resposta 3')), //perguntas.elementAt(0)
          ],
        ),
      ),
    );
  }
}
