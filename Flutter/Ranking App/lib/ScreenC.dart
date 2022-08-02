import 'package:flutter/material.dart';
import 'package:myapp/NoUse_Example_button.dart';



class ScreenC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  // TODO: implement createState
  return ScreenCState();
  }
}

class ScreenCState extends State<ScreenC> {
  int counter = 0;

  @override
  Widget build(BuildContext context2) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.red[200],),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times: '),
                Text(
                  '$counter',
                  style: Theme
                      .of(context2)
                      .textTheme
                      .displayMedium,
                )
              ]
          ),),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.red[200],
            onPressed: () {
              setState(() {
                counter++;
                print("$counter");
              });
            },),
      ),
    );
  }
}