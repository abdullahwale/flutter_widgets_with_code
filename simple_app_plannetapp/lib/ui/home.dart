import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC;
  bool switchValue = false;
  double _finalResult = 0.0;
  String _planetName = "";
  void handleRadioValueChanged(int value) {
    radioValue = value;
    setState(() {
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _planetName =
              "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _planetName =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _planetName =
              "Your Venus on Pluto is ${_finalResult.toStringAsFixed(1)}";

          break;
        default:
          print("Nothing selected!");
      }

      //print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 280.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'What is your Weight on Earth',
                        hintText: 'In Ponds',
                        icon: Icon(Icons.person_outline)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<int>(
                    activeColor: Colors.brown,
                    value: 0,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
                Text(
                  "Pluto",
                  style: new TextStyle(color: Colors.white30),
                ),
                Radio<int>(
                    activeColor: Colors.brown,
                    value: 1,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
                Text(
                  "Mars",
                  style: new TextStyle(color: Colors.white30),
                ),
                Radio<int>(
                    activeColor: Colors.brown,
                    value: 2,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
                Text(
                  "Venus",
                  style: new TextStyle(color: Colors.white30),
                ),
              ],
            ),
            //Result text
            Padding(padding: new EdgeInsets.all(15.0)),

            Text(
              _weightController.text.isEmpty
                  ? "Please enter weight"
                  : _planetName + " lbs",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.38; // give a default weight! Be creative!
    }
  }
}
