import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String result = "Preencha os campos.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      body: _body()
    );
  }

  _title() {
    return AppBar(
      title: Text("Cálculo IMC"),
      centerTitle: true,
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _foto(),
          _field("Peso", pesoController),
          _field("Altura", alturaController),
          _button(),
          _text()
        ]
      )
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        "https://ichef.bbci.co.uk/news/640/cpsprodpb/15E02/production/_104620698_prmo_imc_br-nc.png",
        width: 300,
        height: 300
        )
    );
  }

  _text() {
    return Text(
      result,
      style: TextStyle(color: Colors.black, fontSize: 20)
    );
  }

  _field(label, controller) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: controller,
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
        "Calcular",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  _calculate() {
    setState(() {
      double peso = double.parse(pesoController.text), altura = double.parse(alturaController.text);
      double imc = peso / (altura * altura);

      print(imc);

      if(imc < 18.5) result = "Abaixo do Peso";
      else if(imc < 25) result = "Peso Normal";
      else if(imc < 30) result = "Sobrepeso";
      else if(imc < 35) result = "Obesidade Grau I";
      else if(imc < 40) result = "Obesidade Grau II";
      else result = "Obesidade Grau III ou Mórbida";
    });
  }
}