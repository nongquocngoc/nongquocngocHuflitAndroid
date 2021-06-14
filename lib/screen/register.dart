import 'package:flutter/material.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/screen/login.dart';



class RegisterScreen extends StatefulWidget{
  static const routeName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final confirmpassword = TextEditingController();
  bool checkedValue = true;

  funcRegister() {
    final strUserName = userName.text;
    final strPassword = password.text;
    final strfirstName = firstName.text;
    final strlastName = lastName.text;
    if (strUserName != '' && strPassword != '' && strfirstName != '' &&
        strlastName != '') {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Info'),
              content: Text('Register successfull'),
              actions: [
                TextButton(
                  onPressed: () {
                    return Navigator.popUntil(
                        context, ModalRoute.withName(LoginScreen.routeName));
                  },
                  child: Text('Ok'),
                ),
              ],
            );
          }
      );
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text('Please fill all informations'),
              actions: [
                TextButton(
                  onPressed: () {
                    return Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),

      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 70,
              height: 70,
              child: Image.asset('assets/logos/logo1.png'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Flexible(
                    child: new TextField(
                        controller: firstName,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'FirsterName'
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  new Flexible(
                    child: new TextField(
                      controller: lastName,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(),
                          labelText: 'last Name'
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: userName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'UserName'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'password'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: confirmpassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Confirm Password'
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: CheckboxListTile(
                  title: Text('I accept the Terms of Use & Privacy Policy'),
                  value: checkedValue,
                  onChanged: (newValue) {

                  },
                  controlAffinity: ListTileControlAffinity.leading,
                )
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
                child: Text('Register Now'),
                onPressed: () {
                  funcRegister();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}