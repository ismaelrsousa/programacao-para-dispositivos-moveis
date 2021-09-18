import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

  String result = "Informe os números!";

  void _multiplicacao() {
    setState(() {
      double n1 = double.parse(n1Controller.text), n2 = double.parse(n2Controller.text);
      double resultado = n1 * n2;
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
      title: Text("Multiplicador de Números"),
      centerTitle: true,
      backgroundColor: Colors.blue,
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
          labelStyle: TextStyle(color: Colors.blue)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blue, fontSize: 25.0),
      controller: controller,
    );
  }
 
  _texto(text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0)
    );
  }
 
  _button() {
    return RaisedButton(
      color: Colors.blue,
      //onPressed: null,
      //onPressed: () {
      //print("Okay!");
      //},
      onPressed: _multiplicacao,
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