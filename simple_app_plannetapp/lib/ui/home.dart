import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body:  Container(
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            Image.asset('images/planet.png',
            height: 133.0,
            width: 280.0,),
          ],
        ),

      );
    );
  }


}
