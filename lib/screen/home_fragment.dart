import 'package:flutter/material.dart';
class HomeFragmentWidget extends StatelessWidget {

  static const routeName = "/homefragment";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home', style: TextStyle(fontSize: 24),),
    );
  }
}