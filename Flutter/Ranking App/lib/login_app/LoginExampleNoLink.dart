import 'package:myapp/my_button/my_button.dart';
import 'package:flutter/material.dart';
import 'dice.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {}
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {}
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            // FocusNode: 포커스를 받는 특정 위젯을 식별, FocusScope ; 어떤 위젯들까지 포커스를 받는지
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(image: AssetImage('images/chef.gif'),
                        width: 170.0,
                        height: 190.0),
                  ),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.teal,
                              inputDecorationTheme: InputDecorationTheme(
                                  labelStyle:
                                  TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15.0
                                  )
                              )
                          ),
                          child: Container(
                              padding: EdgeInsets.all(40.0),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    controller: controller,
                                    // autofocus: true,
                                    decoration: InputDecoration(
                                        labelText: 'Enter "dice"'
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  TextField(
                                    controller: controller2,
                                    decoration: InputDecoration(
                                        labelText: 'Enter Password'
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                  ),
                                  SizedBox(height: 40.0),
                                  ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                        color: Colors.orangeAccent,
                                        child: Icon(Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          if (controller.text == 'dice' &&
                                              controller2.text == '1234') {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (
                                                    BuildContext context) =>
                                                    Dice()));
                                          } else if (controller.text == 'dice' &&
                                              controller2.text != '1234') {
                                            showSncakBar2(context);
                                          } else if (controller.text != 'dice' &&
                                              controller2.text != '1234') {
                                            showSncakBar3(context);
                                          } else {
                                            showSncakBar(context);

                                          }
                                        }),

                                  ),
                                ],
                              )
                          ))
                  ),
                  _buildButton(),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}


// class LogIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           'Sign In',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         elevation: 0.2,
//       ),
//       body: _buildButton(),
//     );
//   }

  void showSncakBar(BuildContext context){
    Scaffold.of(context).showSnackBar(
        SnackBar(content:
        Text('로그인 정보를 다시 확인하세요',
          textAlign: TextAlign.center,),
          duration:Duration(seconds:2),
          backgroundColor:Colors.blue,
        )
    );
  }

  void showSncakBar2(BuildContext context){
    Scaffold.of(context).showSnackBar(
        SnackBar(content:
        Text('비밀번호가 일치하지 않습니다',
          textAlign: TextAlign.center,),
          duration:Duration(seconds:2),
          backgroundColor:Colors.blue,
        )
    );
  }

  void showSncakBar3(BuildContext context){
    Scaffold.of(context).showSnackBar(
        SnackBar(content:
        Text('dice의 철자를 확인하세요',
          textAlign: TextAlign.center,),
          duration:Duration(seconds:2),
          backgroundColor:Colors.blue,
        )
    );
  }


  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyButton(
            image: Image.asset('images/glogo.png'),
            text: Text(
              'Login with Google',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: (){},
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            height: 50.0,
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('images/flogo.png'),
                  Text(
                    'Login with Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset('images/glogo.png'),
                  ),
                ],
              ),
              color: Color(0xFF334D92),
              onPressed: () {},
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            height: 50.0,
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  Text(
                    'Login with Email',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              color: Colors.green,
              onPressed: () {},
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
          ),
        ],
      ),
    );
  }