import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/screen/bottomnavigationlayout.dart';
import 'package:test_flutter/screen/login.dart';
import 'package:test_flutter/screen/register.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'LoginAPP',
  home: LoginScreen(),
  routes: {
    BottomNavigationLayout.routeName: (ctx) => BottomNavigationLayout(),
    RegisterScreen.routeName: (ctx) => RegisterScreen()
  },
));