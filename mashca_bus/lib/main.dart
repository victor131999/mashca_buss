import 'package:flutter/material.dart';
import 'package:mashca_bus/pages/home_page.dart';
import 'package:mashca_bus/pages/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes:{
        '/': (BuildContext context) => HomePage(),
        'login': (BuildContext context)=> LoginPage(),
      },
    );
  }
}
