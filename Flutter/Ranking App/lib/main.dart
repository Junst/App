import 'package:flutter/material.dart';
import 'package:myapp/ScreenA.dart';
import 'package:myapp/screens/loading.dart';
import 'login_app/dice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/login_app/LoginExampleNoLink.dart';
import 'package:myapp/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/ScreenC.dart';
import 'package:myapp/screens/add.dart';
import 'package:myapp/screens/profile.dart';
import 'package:myapp/screens/QnA.dart';
import 'package:myapp/login_app/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/Search/searchscreen.dart';
import 'package:myapp/screens/personal_screens/bigmac.dart';
import 'package:myapp/screens/personal_screens/mcdonalds.dart';
import 'package:myapp/screens/personal_screens/starbucks.dart';
import 'package:myapp/screens/personal_screens/bananamilk.dart';
import 'package:myapp/screens/personal_screens/starbuckslover.dart';
import 'package:myapp/screens/personal_screens/odimilk.dart';
import 'package:myapp/screens/category_screens/food.dart';
import 'package:myapp/screens/category_screens/sports.dart';
import 'package:myapp/page/filter_local_list_page.dart';
import 'package:myapp/screens/chat_screen.dart';
import 'package:myapp/screens/profile_screens/profileexample.dart';

import 'package:myapp/page/filter_local_list_page.dart';
import 'package:myapp/page/filter_network_list_page.dart';

// void main() => runApp(MyApp());

// run : flutter run --enable-software-rendering

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyAqEW6zFBDqOcxNcgI10N_6iAbQdFBnles",
    appId: "1:443786785898:android:c450866d59e36682064613",
    messagingSenderId: "443786785898",
    projectId: "chat-app-fbe6b",
    storageBucket: "chat-app-fbe6b.appspot.com",)); // options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOLBON',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute:'/', //MainScreen(),
      routes : {
        '/' : (context) => MainScreen(),
        '/a' : (context) => ScreenA(),
        '/login' : (context) => LoginSignupScreen(),
        '/c' : (context) => ScreenC(),
        '/d' : (context) => Loading(),
        '/upload' : (context) => Add(),
        '/profile' : (context) => Grade(),
        '/Qna' : (context) => QnA(),
        '/search': (context) => SearchScreen(),
        '/bigmac': (context) => Bigmac(),
        '/macdonalds':(context) => Macdonalds(),
        '/starbucks':(context) => Starbucks(),
        '/bananamilk':(context) => Bananamilk(),
        '/popeyes':(context) => Macdonalds(),
        '/maraton':(context) => Macdonalds(),
        '/climbing':(context) => Macdonalds(),
        '/namsantower':(context) => Macdonalds(),
        '/surfboard':(context) => Macdonalds(),
        '/food9':(context) => Macdonalds(),
        '/starbuckslover':(context) => StarbucksLover(),
        '/odimilk':(context) => Odimilk(),
        '/foodcategory':(context) => FoodCategory(),
        '/sportscategory':(context) => SportsCategory(),
        '/gamecategory':(context) => SportsCategory(),
        '/studycategory':(context) => SportsCategory(),
        '/languagecategory':(context) => SportsCategory(),
        '/searchandacheive':(context) =>FilterLocalListPage(),
        '/chatqna':(context)=> ChatScreen(),
        '/profileexample':(context)=>ProfileexScreen(),

      },
       //home : MainScreen(),
      // home: new Column(
      //   children: <Widget>[
      //     Button(), MainScreen(),
      //   ]
      // )
      //   ],
      // ),
    );
  }
}
//
// class Button extends StatelessWidget {
//   @override
//   Widget build(BuildContext contextA) { // BuildContext : Widget tree에서 현재 Widget의 위치를 알 수 있는 정보, Widget Type의 build 함수의
//     // BuildContext context 인자 값을 가져옵니다. Bulud method의 Context가 Scaffold에게 물려줍니다.
//     return Scaffold(
//       appBar: AppBar(
//         title:Text('Cherry'),
//         backgroundColor: Colors.red[200],
//         centerTitle: true,
//         elevation: 0.0,
//         // leading: IconButton(
//         //   icon:Icon(Icons.menu), onPressed: (){
//         //     print('menu button is clicked');
//         // },
//         // ),
//         actions: [
//           IconButton(
//             icon:Icon(Icons.shopping_cart), onPressed: () {
//             print('shopping_cart button is clicked');
//             //Navigator.pushNamed(context, '/a');
//             },
//           ),
//           IconButton(
//             icon:Icon(Icons.search), onPressed: () {
//             print('search button is clicked');
//             //Navigator.pushNamed(context, '/b');
//           },
//           ),
//         ],
//       ),
//
//       //body: MySnackBar(), // Widget을 넣어야함.
//
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               currentAccountPicture: CircleAvatar(
//                 backgroundImage: AssetImage("images/solbon.png"),
//                 backgroundColor: Colors.white,
//               ),
//               otherAccountsPictures: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: AssetImage('images/solbon.png'),
//                   backgroundColor: Colors.white,
//                 ),
//                 // CircleAvatar(
//                 //   backgroundImage: AssetImage('images/solbon.png'),
//                 //   backgroundColor:  Colors.white,
//                 // )
//               ], // 복수, 여러개 삽입가능
//               accountName: Text('SOLBON'),
//               accountEmail: Text('solbon@solbon.com'),
//               onDetailsPressed: (){
//                 print('arrow is clicked');
//               },
//               decoration: BoxDecoration(
//                   color: Colors.red[200],
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40.0),
//                       bottomRight: Radius.circular(40.0)
//                   )
//               ), // 박스모양을 둥글게 만들어줍니다
//             ),
//             ListTile(
//               leading: IconButton(
//             icon: Icon(Icons.home,
//                 color: Colors.grey[850]),
//                 onPressed:(){
//                   print('Home is clicked');
//                   Navigator.pushNamed(contextA, '/');
//                 },),
//               title: Text('Home'),
//               trailing: Icon(Icons.add),
//             ),
//             ListTile(
//               leading: IconButton(
//     icon: Icon(Icons.person,
//                   color: Colors.grey[850]),
//                 onPressed:(){
//                   print('Stat is clicked');
//                   Navigator.pushNamed(contextA, '/upload');
//                 }),
//               title: Text('Stat'),
//
//               trailing: Icon(Icons.add),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings,
//                   color: Colors.grey[850]),
//               title: Text('Setting'),
//               onTap:(){
//                 print('Setting is clicked');
//               },
//               trailing: Icon(Icons.add),
//             ),
//             ListTile(
//               leading: Icon(Icons.question_answer,
//                   color: Colors.grey[850]),
//               title: Text('Q&A'),
//               onTap:(){
//                 print('Q&A is clicked');
//               },
//               trailing: Icon(Icons.add),
//             ),
//           ],
//         ),
//       ),
//
//     );
//
//   }
// }