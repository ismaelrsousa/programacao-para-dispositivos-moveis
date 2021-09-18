import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData (
        primaryColor: Colors.blue
      ),
      home: WidgetHome()
    );
  }
}

class WidgetHome extends StatelessWidget {
  const WidgetHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Hello"),
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Text(
            "Hello Ismael!",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              
            ))
        )
      ),
      drawer: Container(
        color: Colors.white
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}