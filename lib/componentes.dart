import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Componentes {
  criaMenu(formKey) {
    return AppBar(
      title: criaTexto('Calculadora IMC', 20, Colors.white, FontWeight.bold),
      centerTitle: true,
      backgroundColor: Colors.green,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            formKey.currentState?.reset();
          },
          icon: const Icon(Icons.refresh),
          tooltip: 'Limpar campos',
        )
      ],
    );
  }

  criaIcone(icone, tamanho, cor) {
    return Icon(
      icone,
      size: tamanho,
      color: cor,
    );
  }

  inputTexto(textoCaixa, mensagemValidacao, sufixo) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextFormField(
        autofocus: true,
        maxLength: 5,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: textoCaixa,
          suffixText: sufixo,
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return mensagemValidacao;
          }
          return null;
        },
        textAlign: TextAlign.center,
      ),
    );
  }

  criaBotao(formKey, nomeBotao, context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        textStyle: TextStyle(fontSize: 20),
        fixedSize: Size(300, 50),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.reset();
          // formKey.currentState?.showSnackBar(
          //   const SnackBar(
          //     content: Text('IMC calculado'),
          //   ),
          // );
        }
      },
      child: Text(nomeBotao),
    );
  }

  criaTexto(texto, tamanho, cor, peso) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: tamanho,
        color: cor,
        fontWeight: peso,
      ),
    );
  }
}
