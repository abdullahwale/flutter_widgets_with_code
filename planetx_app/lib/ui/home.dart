import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: null, //_weightController
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Your Weight on Earth',
                        hintText: 'In pounds',
                        icon: Icon(Icons.person_outline)),
                  ),

                  Padding(padding: EdgeInsets.all(5.0)),
                  //three toggle buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radiobuttons go here
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: null, //radioValue
                          onChanged: null),
                      //handleRadioValueChanged
                      Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: null, //radioValue
                          onChanged: null),
                      //handleRadioValueChanged
                      Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: null, //radioValue
                          onChanged: null //handleRadioValueChanged
                          ),
                      Text(
                        "Venus",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),

                  //Result text
                  Padding(padding: EdgeInsets.all(15.0)),

                  Text(
                    "Text",
                    // _weightController.text.isEmpty ? "Please enter weight" : _planetName +" lbs",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
