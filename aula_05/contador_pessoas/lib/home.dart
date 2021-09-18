import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int people = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      body: _body()
    );
  }

  _title() {
    return AppBar(
      title: Text("Contador de Pessoas"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _body() {
    return Container (
      width: double.infinity,
      color: Colors.white,
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(people),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _button("+", Colors.greenAccent, _add),
              _button("-", Colors.redAccent, _remove)
            ]
          )
        ]
      )
    );
  }

  _text(content) {
    return Text(
      content.toString(),
      style: TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
    );
  }

  _button(label, color, onpress) {
    return RaisedButton(
      color: color,
      onPressed: onpress,
      child: Text(
        label,
        style: TextStyle(fontSize: 30)
      )
    );
  }

  _add() {
    setState(() {
      people++;
    });
  }

  _remove() {
    setState(() {
      if(people > 0)
        people--;
    });
  }
}