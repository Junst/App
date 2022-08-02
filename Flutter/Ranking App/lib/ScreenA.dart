import 'package:flutter/material.dart';
import 'package:myapp/NoUse_Example_button.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext contextA) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.red[200],
    title: Text('HELP & +'),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children :<Widget>[
          RaisedButton(
            color: Colors.red[200],
            child: Text("Help"),
            onPressed: (){
              Navigator.pushNamed(contextA, '/b');
            },),
      RaisedButton(
        color: Colors.red[200],
        child: Text("Easter Egg"),
        onPressed: (){
          Navigator.pushNamed(contextA, '/c');
        },)]
    ),)
    );
    }
  }
