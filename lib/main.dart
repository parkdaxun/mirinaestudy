import 'package:flutter/material.dart';
import 'package:mirinaestudy/screen/home_screen.dart';
import 'package:mirinaestudy/screen/mypage_screen.dart';
import 'package:mirinaestudy/widget/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirinae Study',
      theme: ThemeData(
        primaryColor: Color(0xff5F2FA8),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              MypageScreen(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        )
      )
    );
  }
}