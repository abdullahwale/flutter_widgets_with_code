import 'package:flutter/material.dart';
import 'dart:math';

class DiceDesign extends StatefulWidget {
  @override
  _DiceDesignState createState() => _DiceDesignState();
}

class _DiceDesignState extends State<DiceDesign> {
  var dice1 = 1;
  var dice2 = 1;
  var dice3 = 1;
  var dice4 = 1;

  int turn = 1;
  int turn2 = 0;
  int turn3 = 0;
  int turn4 = 0;

  var count1 = 1;
  var count2 = 1;
  var count3 = 1;
  var count4 = 1;
  var l = 0;
  var m = 0;
  var n = 0;
  var o = 0;
  var x = 0;
  var y = 0;
  var z = 0;
  var winner = "Chose Winner";

  void _count1() {
    setState(() {
      count1++;
      l = l + dice1;
    });
  }

  void _count2() {
    setState(() {
      count2++;
      m = m + dice2;
    });
  }

  void _count3() {
    setState(() {
      count3++;
      n = n + dice3;
    });
  }

  void _count4() {
    setState(() {
      count4++;
      o = o + dice4;
    });
  }

  void maximum(l, m, n, o) {
    x = max(l, m);
    y = max(n, o);
    z = max(x, y);
  }

  void _winner(l, m, n, o, z) {
    if (z == l) {
      winner = "Dice 1 is winner";
    }
    if (z == m) {
      winner = "Dice 2 is winner";
    }
    if (z == n) {
      winner = "Dice 3 is winner";
    }
    if (z == o) {
      winner = "Dice 4 is winner";
    }
  }

  bool _enabled;
  bool _enabled1;
  bool _enabled2;
  bool _enabled3;
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    var _onPressed1;
    var _onPressed2;
    var _onPressed3;

    if (count1 < 10) {
      _enabled = true;
    }
    if (count1 > 10) {
      _enabled = false;
    }
    if (count2 < 10) {
      _enabled1 = true;
    }
    if (count2 > 10) {
      _enabled1 = false;
    }
    if (count3 < 10) {
      _enabled2 = true;
    }
    if (count3 > 10) {
      _enabled2 = false;
    }
    if (count4 < 10) {
      _enabled3 = true;
    }
    if (count4 > 10) {
      _enabled3 = false;
    }

    if (_enabled && turn == 1) {
      _onPressed = () {
        setState(() {
          dice1 = Random().nextInt(6) + 1;
          _count1();
          turn = 0;
          turn2 = 1;
          turn3 = 0;
          turn4 = 0;
        });
        if (dice1 == 6) {
          turn = 1;
          turn2 = 0;
        }
      };
    }

    if (_enabled1 && turn2 == 1) {
      _onPressed1 = () {
        setState(() {
          dice2 = Random().nextInt(6) + 1;
          _count2();
          turn = 0;
          turn2 = 0;
          turn3 = 1;
          turn4 = 0;
        });
        if (dice2 == 6) {
          turn2 = 1;
          turn3 = 0;
        }
      };
    }

    if (_enabled2 && turn3 == 1) {
      _onPressed2 = () {
        setState(() {
          dice3 = Random().nextInt(6) + 1;
          _count3();
          turn = 0;
          turn2 = 0;
          turn3 = 0;
          turn4 = 1;
        });
        if (dice3 == 6) {
          turn3 = 1;
          turn4 = 0;
        }
      };
    }

    if (_enabled3 && turn4 == 1) {
      _onPressed3 = () {
        setState(() {
          dice4 = Random().nextInt(6) + 1;
          _count4();
          turn = 1;
          turn2 = 0;
          turn3 = 0;
          turn4 = 0;
        });
        if (dice4 == 6) {
          turn4 = 1;
          turn = 0;
        }
      };
    }

    void _showcontent() {
      showDialog(
        context: context, barrierDismissible: false, // user must tap button!

        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('$winner'),
                ],
              ),
            ),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(70.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: _onPressed,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Image(
                      height: 70.0,
                      image: AssetImage("../images/d$dice1.jpg"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: _onPressed1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Image(
                      height: 70.0,
                      image: AssetImage("../images/d$dice2.jpg"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 25.0,
            height: 25.0,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: _onPressed2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Image(
                      height: 70.0,
                      image: AssetImage("../images/d$dice3.jpg"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: _onPressed3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Image(
                      height: 70.0,
                      image: AssetImage("../images/d$dice4.jpg"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 25.0,
            height: 50.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Expanded(
                  child: Text('Dice 1 = $l '),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                child: Expanded(
                  child: Text('Dice 2 = $m '),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 25.0,
            height: 50.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Expanded(
                  child: Text('Dice 3 = $n '),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                child: Expanded(
                  child: Text('Dice 4 = $o '),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 25.0,
            height: 50.0,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    setState(() {
                      maximum(l, m, n, o);
                    });
                  },
                  child: Text('Max = $z '),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 25.0,
            height: 50.0,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (count4 > 2) {
                      setState(() {
                        _winner(l, m, n, o, z);
                        _showcontent();
                      });
                    }
                  },
                  child: Text('Choose Winner'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
