import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/bottom_bar.dart';

class MainScreen extends StatefulWidget {
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}