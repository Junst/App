import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Bigmac(),
      ),
    );
  }
}

class Bigmac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[800],
      // appBar: AppBar(
      //   title:Text('character Card'),
      //   backgroundColor: Colors.pinkAccent[700],
      //   centerTitle: true,
      //   elevation: 0.0, //입체감 없애기
      // ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.00, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Center(
              child:CircleAvatar(
                // ctrl+ space 속성확인
                backgroundImage: AssetImage('assets/bigmac.jpg'),
                backgroundColor: Colors.white,
                radius : 120.0,
              ),
            ),
            Divider(
              height: 60.0,
              color:Colors.black,
              thickness: 0.5,
              endIndent: 30.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Title',
              style: TextStyle(
                color: Colors.black,
                letterSpacing : 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('나는 빅최오~!',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
            Text('Total Acheivement Person',
              style: TextStyle(
                color: Colors.black,
                letterSpacing : 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('73,312명',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Relevant Title',
              style: TextStyle(
                color: Colors.black,
                letterSpacing : 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
    InkWell(child:Text('맥도날드 러버',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
      onTap: () {
        print("맥도날드 러버");
        Navigator.pushNamed(context, '/macdonalds');
      },),
            // SizedBox(
            //   height:30.0,
            // ),
            // Row(
            //   children: <Widget>[
            //     Icon(Icons.check_circle_outline),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     Text('best title maker',
            //       style: TextStyle(
            //           fontSize: 16.0,
            //           letterSpacing: 1.0
            //       ),),
            //   ],
            // ),
            // Row(
            //   children: <Widget>[
            //     Icon(Icons.check_circle_outline),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     Text('verificated id',
            //       style: TextStyle(
            //           fontSize: 16.0,
            //           letterSpacing: 1.0
            //       ),),
            //   ],
            // ),
            // Row(
            //   children: <Widget>[
            //     Icon(Icons.check_circle_outline),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     Text('after 18+ years old',
            //       style: TextStyle(
            //           fontSize: 16.0,
            //           letterSpacing: 1.0
            //       ),
            //     ),
            //   ],
            // ),
            // Center(
            //     child: CircleAvatar(
            //       backgroundImage: AssetImage('images/solbon.png'),
            //       radius: 40.0,
            //       backgroundColor: Colors.pinkAccent[800],
            //     )
            // )
          ],
        ),
      ),
    );
  }
}