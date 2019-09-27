import 'package:flutter/material.dart';
import 'package:asweomelogin/util/login.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyLogin(),
      ),
    );
  }
}