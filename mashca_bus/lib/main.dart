import 'package:flutter/material.dart';
import 'package:mashca_bus/pages/home_page.dart';
import 'package:mashca_bus/pages/login_page.dart';
import 'package:mashca_bus/themes/theme_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mashca Bus',
      theme: ThemeMain.setup(),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
      },
    );
  }
}