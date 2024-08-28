import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/app_bar.dart';

class HomeworkScreen extends StatefulWidget {
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '과제'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('과제'),
              ),
            )
          ],
        ),
      ),
    );
  }
}