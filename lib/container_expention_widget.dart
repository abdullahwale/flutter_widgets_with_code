/*
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainApp());
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
            child: ExpansionCard(
              borderRadius: 20,
              background: Image.asset(
                "images/planets.gif",
                fit: BoxFit.cover,
              ),
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Header",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Sub",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  child: Text("Content goes over here !",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                )
              ],
            )));
  }
}
 */
