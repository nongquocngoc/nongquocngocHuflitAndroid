import 'package:flutter/material.dart';
import 'package:test_flutter/screen/bottomnavigationlayout.dart';
import 'package:test_flutter/screen/home_fragment.dart';
import 'package:test_flutter/screen/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class LoginScreen extends StatefulWidget {
  static const routeName = "/";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userName = TextEditingController();
  final password = TextEditingController();


  funcLogin() async{
    final strUserName = userName.text;
    final strPassWord = password.text;
    var data = {'username': strUserName, 'password' : strPassWord};
    String url = 'http://a106b69f51f7.ngrok.io/login';
    final http.Response response =  await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode(data)
    );

    if (response.statusCode == 200) {
      return Navigator.of(context).pushNamed(BottomNavigationLayout.routeName);
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text('Username or password is not correct.'),
              actions: [
                TextButton(
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          });
    }

    // if(strUserName=='admin'&&strPassWord=='123')
    //   {
    //     Navigator.of(context).pushReplacementNamed(BottomNavigationLayout.routeName);
    //   }
    // else{
    //   return showDialog(
    //     context: context,
    //     builder: (BuildContext context){
    //       return AlertDialog(
    //         title: Text('Warning'),
    //         content: Text('Username or password is not correct.'),
    //         actions: [
    //           TextButton(
    //             onPressed: (){
    //               return Navigator.of(context).pop();
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     }
    //   );
    // }
  }

  funcRegister() {
    return Navigator.of(context).pushNamed(RegisterScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 150,
              child: Image.asset('assets/logos/logo.png'),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(
                'LOGIN INFORMATION',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: userName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'User Name'),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
                onPressed: () {},
                textColor: Colors.blue,
                child: Text('Forgot Password')),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
                child: Text('Login'),
                onPressed: () {
                  setState(() {
                    funcLogin();
                  });
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Does not have account ? '),
                  // ignore: deprecated_member_use
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      funcRegister();
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
