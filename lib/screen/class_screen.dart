import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassScreen extends StatefulWidget {
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('수업 화면'),
      ),
    );
  }
}