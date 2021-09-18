import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController numeroController = TextEditingController();
  String result = "Preencha o campo.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      body: _body()
    );
  }

  _title() {
    return AppBar(
      title: Text("Álcool e Gasolina"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _foto("https://cdnb.artstation.com/p/assets/images/images/006/259/363/large/steven-shea-riddler-drip.jpg?1497210802"),
          _field("Pense em um nº de 0 a 10", numeroController),
          _button(),
          _text()
        ]
      )
    );
  }

  _foto(url) {
    return Center(
      child: Image.network(
        url,
        height: 200,
        width: 200),
    );
  }

  _field(label, controller) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontSize: 14,)
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: controller,
    );
  }

  _text() {
    return Text(
      result,
      style: TextStyle(color: Colors.black, fontSize: 20)
    );
  }

  _button() {
    return RaisedButton(
      color: Colors.green,
      //onPressed: null,
      //onPressed: () {
      //print("Okay!");
      //},
      onPressed: _calculate,
      child: Text(
        "Descobrir",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  _calculate() {
    setState(() {
      int numero = new Random().nextInt(10);
      int guess = int.parse(numeroController.text);

      if(guess == numero) result = "$numero, acertei";
      else result = "$numero? não? na próxima eu acerto";
      
    });
  }
}