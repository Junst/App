// Flutter Material Library를 넣어야 할 수 있습니다.
import 'package:flutter/material.dart'; //fm만 입력해도 나올 수 있습니다.
void main() => runApp(MyApp2()); // 최상위 함수  // app의 시작점 // runApp(widget) : widget 안엔 custom widget  // Dart 코딩 시에는 세미콜론이 필요하다

// main(),runApp() 함수 : 소문자로 시작 <-> MyApp() class : 대문자로 시작
// MyApp()은 stateless 위젯이 된다.

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // argument를 가져야한다. container -> materialApp으로 바꾸기
      title: 'First app',
      theme : ThemeData(
        primarySwatch: Colors.blue // 견본을 의미합니다. 특정 색을 기본색상으로 지정함.
      ),
       home: MyCard(), // 가장 먼저 화면에 보여주는 경로
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // App 화면에 다양한 기능을 제공할 수 있게 함, 만약 없다면 app 화면에 배치 불가능합니다.
      appBar: AppBar(
        title: Text('First app'),
      ),
      body: Center(
        child : Column(
          children: <Widget>[
            Text('Hello'),
            Text('Hello'),
            Text('Hello')
          ], // child, children 차이 : 안에 한가지 위젯요소가(column, row) 하나라면 child, 2가지 이상이라면 children 사용(형태는 리스트)
        ),
      ), // 자식 widget을 가질 수 있다.
    );
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // App 화면에 다양한 기능을 제공할 수 있게 함, 만약 없다면 app 화면에 배치 불가능합니다.
      appBar: AppBar(
        title: Text('SOLBON'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0, //flat한 느낌 없애줌
      ),
      body: Center(
        child : Column(
          // mainAxisAlignment: MainAxisAlignment.center ,// 세로 중앙 정렬
          children: <Widget>[
            Text('HELLO'),
            Text('HELLO'),
            Text('HELLO')
          ],
        ),
      ), // 자식 widget을 가질 수 있다.
    );
  }
}