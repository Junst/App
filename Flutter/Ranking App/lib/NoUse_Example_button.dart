import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/ScreenA.dart';
import 'package:myapp/ScreenC.dart';
import 'package:myapp/screens/loading.dart';
import 'package:myapp/login_app/LoginExampleNoLink.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appbar',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      initialRoute:'/', //Button(),
      routes : {
        '/' : (context) => Button(),
        '/a' : (context) => ScreenA(),
        '/b' : (context) => LogIn(),
        '/c' : (context) => ScreenC(),
        '/d' : (context) => Loading(),
       },
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // BuildContext : Widget tree에서 현재 Widget의 위치를 알 수 있는 정보, Widget Type의 build 함수의
    // BuildContext context 인자 값을 가져옵니다. Bulud method의 Context가 Scaffold에게 물려줍니다.
    return Scaffold(
      appBar: AppBar(
        title:Text('Rank'),
        backgroundColor: Colors.red[200],
        centerTitle: true,
        elevation: 0.0,
        // leading: IconButton(
        //   icon:Icon(Icons.menu), onPressed: (){
        //     print('menu button is clicked');
        // },
        // ),
        actions: [
        IconButton(
         icon:Icon(Icons.shopping_cart), onPressed: () {
      print('shopping_cart button is clicked');
    },
        ),
         IconButton(
    icon:Icon(Icons.search), onPressed: () {
           print('search button is clicked');
         },
    ),
        ],
      ),

      body: MySnackBar(), // Widget을 넣어야함.

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/solbon.png"),
              backgroundColor: Colors.white,
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('images/solbon.png'),
                  backgroundColor: Colors.white,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('images/solbon.png'),
                //   backgroundColor:  Colors.white,
                // )
              ], // 복수, 여러개 삽입가능
              accountName: Text('SOLBON'),
              accountEmail: Text('solbon@solbon.com'),
              onDetailsPressed: (){
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)
                )
              ), // 박스모양을 둥글게 만들어줍니다
            ),
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.grey[850]),
              title: Text('Home'),
              onTap:(){
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.person,
                  color: Colors.grey[850]),
              title: Text('Stat'),
              onTap:(){
                print('Stat is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                  color: Colors.grey[850]),
              title: Text('Setting'),
              onTap:(){
                print('Setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                  color: Colors.grey[850]),
              title: Text('Q&A'),
              onTap:(){
                print('Q&A is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),

    );

  }
}
    class MySnackBar extends StatelessWidget{
      @override
      Widget build(BuildContext context) {
        return Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
            FlatButton(
            onPressed:(){
              flutterToast();
            },
            child: Text('Toast'),
            color: Colors.blue,
          ),
         RaisedButton(
             child: Text("Go to the Second Page"),
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(
                   builder: (_)=> SecondPage() // _ 사용하지 않는 값을 의미한다. 매개변수 A, A=인자값 4
               ));
             }
         ),
          RaisedButton(
              child: Text("Go to the Screen A"),
              onPressed: (){
                Navigator.pushNamed(context, '/a');
              }
          ),
          RaisedButton(
              child: Text("Weather"),
              onPressed: (){
                Navigator.pushNamed(context, '/d');
              }
          ),
         RaisedButton(
          child:Text('Show me'),
            onPressed:() {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Hello',
                textAlign:TextAlign.center,
                style: TextStyle(
                  color:Colors.white
                ),
              ),
                backgroundColor: Colors.teal,
                  duration: Duration(milliseconds: 1000 ), // 1 초를 의미
              ),
              );
            }),
            ],
            ),
          );
    }
    }

void flutterToast(){
  Fluttertoast.showToast(msg: 'Flutter',
  gravity : ToastGravity.BOTTOM,
  backgroundColor: Colors.redAccent,
  fontSize: 20.0,
  textColor: Colors.white,
  toastLength: Toast.LENGTH_SHORT);
    }
// NAVIGATOR는 PUSH, POP 스택 구조라서 위에 페이지가 쌓이는 구조이다.
    class SecondPage extends StatelessWidget {
      const SecondPage({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context2) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Second Page'),
          ),
          body: Center(
            child: RaisedButton(
                child: Text("Go to the First Page"),
                onPressed: (){
                  Navigator.pop(context2);
                }
            ),
          ),
        );
      }
    }


//
//   Builder(builder:(BuildContext ctx){
//     return Center(
//       child: FlatButton(
//         child: Text('Show me',
//           style: TextStyle(
//               color: Colors.white
//           ),
//         ),
//         color:Colors.red,
//         onPressed: (){
//           Scaffold.of(ctx).showSnackBar(SnackBar(
//             content: Text('Hello',
//           textAlign: TextAlign.center,
//             style : TextStyle(
//               color: Colors.white).
//             ),
//             backgroundColor: Colors.teal,
//           ),
//           );
//         },
//       ),
//     );
//   },)
// // Scaffold.of(context) method : "현재 주어진 context에서 위로 올라가면서 가장 가까운 Scaffold를 찾아서 반환하라"
// // Something.of(context), Theme.of(context) 가장  가까운 context를 찾아서 이동하라