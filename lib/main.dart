import 'package:flutter/material.dart';
import 'package:mirinaestudy/screen/splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mirinea study',
      home: SplashScreen(),
    );
  }
}