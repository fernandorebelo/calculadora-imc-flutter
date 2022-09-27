import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Componentes {
  criaMenu(formKey, funcao) {
    return AppBar(
      title: criaTexto('Calculadora IMC', 20, Colors.white, FontWeight.bold),
      centerTitle: true,
      backgroundColor: Colors.green,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            funcao();
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

  inputTexto(tipo, textoCaixa, mensagemValidacao, sufixo, controlador) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextFormField(
        autofocus: true,
        maxLength: 5,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
        keyboardType: tipo,
        controller: controlador,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          labelText: textoCaixa,
          suffixText: sufixo,
          labelStyle: const TextStyle(
            color: Colors.green,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return mensagemValidacao;
          }
          return null;
        },
      ),
    );
  }

  criaBotao(formKey, nomeBotao, funcaoCalcular) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  funcaoCalcular();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                nomeBotao,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );

    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: Colors.green,
    //     textStyle: TextStyle(fontSize: 20),
    //     fixedSize: Size(300, 50),
    //   ),
    //   onPressed: () {
    //     if (formKey.currentState!.validate()) {
    //       formKey.currentState?.reset();
    //       // formKey.currentState?.showSnackBar(
    //       //   const SnackBar(
    //       //     content: Text('IMC calculado'),
    //       //   ),
    //       // );
    //     }
    //   },
    //   child: Text(nomeBotao),
    // );
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
