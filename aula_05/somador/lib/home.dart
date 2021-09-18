import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  TextEditingController n3Controller = TextEditingController();

  String result = "Informe os números!";

  void _soma() {
    setState(() {
      double n1 = double.parse(n1Controller.text), n2 = double.parse(n2Controller.text), n3 = double.parse(n3Controller.text);
      double resultado = n1 + n2 + n3;
      result = "Resultado: $resultado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _body()
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Somador de Números"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }


  _body() {
    return Container(
      width: double.infinity,
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _campo("Digite o 1º número", n1Controller),
          _campo("Digite o 2º número", n2Controller),
          _campo("Digite o 3º número", n3Controller),
          _button(),
          _texto(result),
        ],
      ),
    );
  }

  _campo(label, controller) {
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
 
  _texto(text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0)
    );
  }
 
  _button() {
    return RaisedButton(
      color: Colors.green,
      //onPressed: null,
      //onPressed: () {
      //print("Okay!");
      //},
      onPressed: _soma,
      child: Text(
        "Calcular",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}