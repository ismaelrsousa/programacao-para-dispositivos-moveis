import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alcoholController = TextEditingController();
  TextEditingController gasController = TextEditingController();
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
          _foto("https://p2.trrsf.com/image/fget/cf/940/0/images.terra.com/2021/07/05/gasolina.jpg"),
          _field("Preço do Álcool", alcoholController),
          _field("Preço da Gasolina", gasController),
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
      double alcohol = double.parse(alcoholController.text), gas = double.parse(gasController.text);
      double resultado = alcohol/gas;

      if(resultado > .7) result = "Gasolina é a melhor opção";
      else result = "Álcool é a melhor opção";
    });
  }
}