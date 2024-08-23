import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeworkScreen extends StatefulWidget {
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('과제 화면'),
      ),
    );
  }
}