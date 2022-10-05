import 'dart:developer';

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
    return const CalculadoraImc();
  }
}

class CalculadoraImc extends StatefulWidget {
  const CalculadoraImc({super.key});

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String mensagem = 'Informe os seus dados';
  double contador = 0;
  double imc = 0;
  bool condicaoAbaixo = false;
  bool condicaoNormal = false;
  bool condicaoSobrepeso = false;
  bool condicaoGrauI = false;
  bool condicaoGrauII = false;
  bool condicaoGrauIII = false;
  Color cor = Colors.green;

  limparCampos() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      mensagem = 'Informe os seus dados';
      _formKey = GlobalKey<FormState>();
    });
  }

  calcularImc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      imc = peso / (altura * altura);
      String imcTxt = imc.toStringAsPrecision(4);
      if (imc < 18.5) {
        mensagem = 'IMC = $imcTxt | Abaixo do Peso.';
        contador = imc;
        condicaoAbaixo = true;
        condicaoAbaixo ? cor = Colors.red : cor = Colors.green;
      } else if (imc > 18.6 && imc < 24.9) {
        mensagem = 'IMC = $imcTxt | Peso Normal.';
        contador = imc;
        condicaoNormal = false;
        condicaoNormal ? cor = Colors.amber : cor = Colors.green;
      } else if (imc > 25 && imc < 29.9) {
        mensagem = 'IMC = $imcTxt | Sobrepeso.';
        contador = imc;
        condicaoSobrepeso = true;
        condicaoSobrepeso ? cor = Colors.amber : cor = Colors.green;
      } else if (imc > 30 && imc < 34.9) {
        mensagem = 'IMC = $imcTxt | Obesidade Grau I.';
        contador = imc;
        condicaoGrauI = true;
        condicaoGrauI ? cor = Colors.purple : cor = Colors.green;
      } else if (imc > 35 && imc < 39.9) {
        mensagem = 'IMC = $imcTxt | Obesidade Grau II.';
        contador = imc;
        condicaoGrauII = true;
        condicaoGrauIII ? cor = Colors.cyan : cor = Colors.green;
      } else if (imc >= 40) {
        mensagem = 'IMC = $imcTxt | Obesidade Grau III ou Mórbida.';
        contador = imc;
        condicaoGrauIII = true;
        condicaoGrauIII ? cor = Colors.pink : cor = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora IMC',
      home: paginaHome(),
    );
  }

  paginaHome() {
    return Scaffold(
        appBar: Componentes().criaMenu(_formKey, limparCampos),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Componentes().criaIcone(Icons.person_outline, 150, Colors.green),
              Componentes().inputTexto(
                  TextInputType.number,
                  'Digite seu peso em Kg | Ex: 70.5',
                  'Peso obrigatório',
                  'kg',
                  pesoController),
              Componentes().inputTexto(
                  TextInputType.number,
                  'Digite sua altura em metros | Ex: 1.75',
                  'Altura obrigatória',
                  'm',
                  alturaController),
              Componentes().criaBotao(_formKey, 'Calcular', calcularImc),
              Componentes().criaTexto(
                mensagem,
                15,
                cor,
                FontWeight.normal,
              ),
            ],
          ),
        ));
  }
}
