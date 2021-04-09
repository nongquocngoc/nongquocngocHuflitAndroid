import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text("LoginPage", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
            ),
            body: FormLogin(),backgroundColor: Colors.white,),
      ),
    );
  }
}

class FormLogin extends StatefulWidget {
  const FormLogin({Key key}) : super(key: key);

  @override
  _FormLogin createState() => _FormLogin();
}

class _FormLogin extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 50, 20, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Image.asset(
                        "assets/logos/logo.png",
                        width: 100,
                        height: 50,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username'),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your Password'),
                  obscureText: true,
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: OutlinedButton(
                child: Text("Login"),
                onPressed: null,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                child: CheckboxListTile(
                  title: Text("Remember me"),
                  value: false,
                  onChanged: (newValue) {
                    setState(() {
                      newValue = true;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: FlatButton(
                child: new Text("Does'n have account, Register."),
                onPressed: () {},
              ),
            ),
          ],
        )),
      ),
    );
  }
}
