import 'package:flutter/material.dart';
import 'package:myapp/screens/add.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/label.dart';
import 'package:myapp/screens/profile.dart';

import 'notifications.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int _page = 0;

  List icons = [
    Icons.home,
    Icons.label,
    Icons.add,
    Icons.notifications,
    Icons.person,
  ];

  List pages = [
    Home(),
    Label(),
    Add(),
    Notifications(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Cherry'),
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
            icon:Icon(Icons.lightbulb), onPressed: () {
            print('help button is clicked');
            Navigator.pushNamed(context, '/a');
          },
          ),
          IconButton(
            icon:Icon(Icons.search), onPressed: () {
            print('search button is clicked');
            Navigator.pushNamed(context, '/search');
          },
          ),
        ],
      ),
      //body: MySnackBar(), // Widget을 넣어야함.

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
              leading: IconButton(
                icon: Icon(Icons.home,
                    color: Colors.grey[850]),
                onPressed:(){
                  print('Home is clicked');
                  Navigator.pushNamed(context, '/'); // https://stackoverflow.com/questions/62747015/listtile-with-button 참조
                },
              ),
              title: FlatButton(
                  onPressed: () {
                    print('Home is clicked');
                    Navigator.pushNamed(context, '/');},
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('Home')])),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: IconButton(
                  icon: Icon(Icons.person,
                      color: Colors.grey[850]),
                  onPressed:(){
                    print('Stat is clicked');
                    Navigator.pushNamed(context, '/profile');
                  }),
              title: FlatButton(
                  onPressed: () {
                    print('Stat is clicked');
                    Navigator.pushNamed(context, '/profile');},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('Stat')])),
              trailing: Icon(Icons.add),
            ),
            // ListTile(
            //   leading: IconButton(
            //       icon: Icon(Icons.settings,
            //           color: Colors.grey[850]),
            //       onPressed:(){
            //         print('Setting is clicked');
            //         Navigator.pushNamed(context, '/profile');
            //       }),
            //   title: FlatButton(
            //       onPressed: () {
            //         print('Setting is clicked');
            //         Navigator.pushNamed(context, '/profile');},
            //       child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[Text('Setting')])),
            //   trailing: Icon(Icons.add),
            // ),
            ListTile(
              leading: IconButton(
                  icon: Icon(Icons.question_answer,
                      color: Colors.grey[850]),
                  onPressed:(){
                    print('Q&A is clicked');
                    Navigator.pushNamed(context, '/chatqna');
                  }),
              title: FlatButton(
                  onPressed: () {
                    print('Q&A is clicked');
                    Navigator.pushNamed(context, '/chatqna');},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('Q&A')])),
              trailing: Icon(Icons.add),
            ),

            ListTile(
              leading: IconButton(
                  icon: Icon(Icons.door_front_door,
                      color: Colors.grey[850]),
                  onPressed:(){
                    print('Logout');
                    Navigator.pushNamed(context, '/login');
                  }),
              title: FlatButton(
                  onPressed: () {
                    print('Logout');
                    Navigator.pushNamed(context, '/login');},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('Logout')])),
              trailing: Icon(Icons.add),
            ),

          ],
        ),
      ),

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller : _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(5, (index) =>  pages[index] ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // SizedBox(width: 7),
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(3),
            buildTabIcon(4),
            // SizedBox(width: 7),
          ],
        ),
        color: Colors.red[200],
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[200],
        elevation: 10.0,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _pageController?.jumpToPage(2),
      ),
    );
  }

 // void navigationTapped(int page) {
 //    _pageController.jumpToPage(page);
 //  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  buildTabIcon(int index) {
      return Container(
        margin: EdgeInsets.fromLTRB( index == 3 ? 30 : 0, 0,  index == 1 ? 30 : 0, 0),
        child: IconButton(
          icon: Icon(
            icons[index],
            color: Colors.white,
            size: 24.0,
          ),
          color: _page == index
              ? Theme.of(context).accentColor
              : Theme.of(context).textTheme.caption?.color,
          onPressed: () => _pageController?.jumpToPage(index),
        ),
      );
  }
}


//
// class Button extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) { // BuildContext : Widget tree에서 현재 Widget의 위치를 알 수 있는 정보, Widget Type의 build 함수의
//     // BuildContext context 인자 값을 가져옵니다. Bulud method의 Context가 Scaffold에게 물려줍니다.
//     return Scaffold(
//       appBar: AppBar(
//         title:Text('Rank'),
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
//           },
//           ),
//           IconButton(
//             icon:Icon(Icons.search), onPressed: () {
//             print('search button is clicked');
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
//               leading: Icon(Icons.home,
//                   color: Colors.grey[850]),
//               title: Text('Home'),
//               onTap:(){
//                 print('Home is clicked');
//               },
//               trailing: Icon(Icons.add),
//             ),
//             ListTile(
//               leading: Icon(Icons.person,
//                   color: Colors.grey[850]),
//               title: Text('Stat'),
//               onTap:(){
//                 print('Stat is clicked');
//               },
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
