import 'package:calculadora_imc/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CalculadoraImc();
  }
}

class CalculadoraImc extends StatefulWidget {
  const CalculadoraImc({super.key});

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora IMC',
      home: paginaHome(),
    );
  }

  paginaHome() {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    late FocusNode myFocusNode;

    @override
    void initState() {
      super.initState();
      myFocusNode = FocusNode();
    }

    @override
    void dispose() {
      myFocusNode.dispose();
      super.dispose();
    }

    return Scaffold(
        appBar: Componentes().criaMenu(_formKey),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Componentes().criaIcone(Icons.person_outline, 150, Colors.green),
              Componentes().inputTexto(
                  'Digite seu peso em Kg | Ex: 70.5', 'Peso obrigatório', 'm'),
              Componentes().inputTexto('Digite sua altura em metros | Ex: 1.75',
                  'Altura obrigatória', 'kg'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Componentes().criaBotao(_formKey, 'Calcular', context),
              )
            ],
          ),
        ));
  }
}
