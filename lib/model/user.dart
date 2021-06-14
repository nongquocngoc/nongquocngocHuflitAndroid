import 'package:test_flutter/model/friend.dart';

class User{
  final int id;
  String firstname;
  String lastname;
  final String username;
  int number;
  String email;
  DateTime createat;
  DateTime lastlogin;
  String profile;
  String photo;
  String block;
  String circle;



  User({this.id,this.firstname,this.lastname,this.username,this.number,this.email,this.createat,this.lastlogin,this.profile,this.photo});

}