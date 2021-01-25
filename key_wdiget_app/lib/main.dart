import 'package:flutter/material.dart';
import 'MyWordPage.dart';
import 'MyListPage.dart';
import 'MyFormPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff090C0B),
      ),
      //home: MyWordPage(),
      home: MyWordPage(),
      //home:MyListPage()
    );
  }
}
