import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          title: Text('Simple Ludo App'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int total = 0;
  int winner = 0;
  int winn = 0;
  int dice1 = 0;
  int dice2 = 0;
  int dice3 = 0;
  int dice4 = 0;
  int limit = 10;
  int left = 1;
  int right = 1;
  int Bleft = 1;
  int Bright = 1;
  int dice1count = 0;
  int dice2count = 0;
  int dice3count = 0;
  int dice4count = 0;
  int flag = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 440.0,
                height: 20.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Text(
                'Total Number of Clicks: 10',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                width: 440.0,
                height: 20.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (dice1count < 10) {
                              if (flag == 1) {
                                Bleft = Random().nextInt(6) + 1;
                                dice1 = dice1 + Bleft;
                                total = total + Bleft;
                                if (Bleft != 6) {
                                  flag = flag + 1;
                                  dice1count = dice1count + 1;
                                }
                              }
                            }
                            ;
                            if (dice1 > dice2 &&
                                dice1 > dice3 &&
                                dice1 > dice4) {
                              winner = dice1;
                              winn = 1;
                            } else if (dice2 > dice1 &&
                                dice2 > dice3 &&
                                dice2 > dice4) {
                              winner = dice2;
                              winn = 2;
                            } else if (dice3 > dice1 &&
                                dice3 > dice2 &&
                                dice3 > dice4) {
                              winner = dice3;
                              winn = 3;
                            } else {
                              winner = dice4;
                              winn = 4;
                            }
                            ;
                            if (dice2count >= dice1count &&
                                dice3count >= dice1count &&
                                dice4count >= dice1count) {
                              if (limit > 0) {
                                if (flag == 2) {
                                  limit = limit - 1;
                                }
                              }
                            }
                            ;
                            if (dice1count == 10 &&
                                dice2count == 10 &&
                                dice3count == 10 &&
                                dice4count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Winner: Dice $winn'),
                                content: Text('Total Points: $winner'),
                                actions: [
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Ok'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        total = 0;
                                        winner = 0;
                                        winn = 0;
                                        dice1 = 0;
                                        dice2 = 0;
                                        dice3 = 0;
                                        dice4 = 0;
                                        limit = 10;
                                        left = 1;
                                        right = 1;
                                        Bleft = 1;
                                        Bright = 1;
                                        dice1count = 0;
                                        dice2count = 0;
                                        dice3count = 0;
                                        dice4count = 0;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Reset'),
                                  ),
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                              );
                            }
                          });
                        },
                        child: Image.asset('images/dice$Bleft.png'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (dice2count < 10) {
                              if (flag == 2) {
                                Bright = Random().nextInt(6) + 1;
                                dice2 = dice2 + Bright;
                                total = total + Bright;
                                if (Bright != 6) {
                                  flag = flag + 1;
                                  dice2count = dice2count + 1;
                                }
                              }
                            }
                            ;
                            if (dice1 > dice2 &&
                                dice1 > dice3 &&
                                dice1 > dice4) {
                              winner = dice1;
                              winn = 1;
                            } else if (dice2 > dice1 &&
                                dice2 > dice3 &&
                                dice2 > dice4) {
                              winner = dice2;
                              winn = 2;
                            } else if (dice3 > dice1 &&
                                dice3 > dice2 &&
                                dice3 > dice4) {
                              winner = dice3;
                              winn = 3;
                            } else {
                              winner = dice4;
                              winn = 4;
                            }
                            ;
                            if (dice1count >= dice2count &&
                                dice3count >= dice2count &&
                                dice4count >= dice2count) {
                              if (limit > 0) {
                                if (flag == 3) {
                                  limit = limit - 1;
                                }
                              }
                            }
                            ;
                            if (dice1count == 10 &&
                                dice2count == 10 &&
                                dice3count == 10 &&
                                dice4count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Winner: Dice $winn'),
                                content: Text('Points: $winner points'),
                                actions: [
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Ok'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        total = 0;
                                        winner = 0;
                                        winn = 0;
                                        dice1 = 0;
                                        dice2 = 0;
                                        dice3 = 0;
                                        dice4 = 0;
                                        limit = 10;
                                        left = 1;
                                        right = 1;
                                        Bleft = 1;
                                        Bright = 1;
                                        dice1count = 0;
                                        dice2count = 0;
                                        dice3count = 0;
                                        dice4count = 0;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Restart'),
                                  ),
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                              );
                            }
                          });
                        },
                        child: Image.asset('images/dice$Bright.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 440.0,
                height: 20.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (dice3count < 10) {
                              if (flag == 3) {
                                left = Random().nextInt(6) + 1;
                                dice3 = dice3 + left;
                                total = total + left;
                                if (left != 6) {
                                  flag = flag + 1;
                                  dice3count = dice3count + 1;
                                }
                              }
                            }
                            ;
                            if (dice1 > dice2 &&
                                dice1 > dice3 &&
                                dice1 > dice4) {
                              winner = dice1;
                              winn = 1;
                            } else if (dice2 > dice1 &&
                                dice2 > dice3 &&
                                dice2 > dice4) {
                              winner = dice2;
                              winn = 2;
                            } else if (dice3 > dice1 &&
                                dice3 > dice2 &&
                                dice3 > dice4) {
                              winner = dice3;
                              winn = 3;
                            } else {
                              winner = dice4;
                              winn = 4;
                            }
                            ;
                            if (dice2count >= dice3count &&
                                dice1count >= dice3count &&
                                dice4count >= dice3count) {
                              if (limit > 0) {
                                if (flag == 4) {
                                  limit = limit - 1;
                                }
                              }
                            }
                            ;
                            if (dice1count == 10 &&
                                dice2count == 10 &&
                                dice3count == 10 &&
                                dice4count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Winner: Dice $winn'),
                                content: Text('Points: $winner points'),
                                actions: [
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Ok'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        total = 0;
                                        winner = 0;
                                        winn = 0;
                                        dice1 = 0;
                                        dice2 = 0;
                                        dice3 = 0;
                                        dice4 = 0;
                                        limit = 10;
                                        left = 1;
                                        right = 1;
                                        Bleft = 1;
                                        Bright = 1;
                                        dice1count = 0;
                                        dice2count = 0;
                                        dice3count = 0;
                                        dice4count = 0;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Restart'),
                                  ),
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                              );
                            }
                          });
                        },
                        child: Image.asset('images/dice$left.png'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (dice4count < 10) {
                              if (flag == 4) {
                                right = Random().nextInt(6) + 1;
                                dice4 = dice4 + right;
                                total = total + right;
                                if (right != 6) {
                                  flag = 1;
                                  dice4count = dice4count + 1;
                                }
                              }
                            }
                            ;
                            if (dice1 > dice2 &&
                                dice1 > dice3 &&
                                dice1 > dice4) {
                              winner = dice1;
                              winn = 1;
                            } else if (dice2 > dice1 &&
                                dice2 > dice3 &&
                                dice2 > dice4) {
                              winner = dice2;
                              winn = 2;
                            } else if (dice3 > dice1 &&
                                dice3 > dice2 &&
                                dice3 > dice4) {
                              winner = dice3;
                              winn = 3;
                            } else {
                              winner = dice4;
                              winn = 4;
                            }
                            ;
                            if (dice2count >= dice4count &&
                                dice3count >= dice4count &&
                                dice1count >= dice4count) {
                              if (limit > 0) {
                                if (flag == 1) limit = limit - 1;
                              }
                            }
                            ;
                            if (dice1count == 10 &&
                                dice2count == 10 &&
                                dice3count == 10 &&
                                dice4count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Winner: Dice $winn'),
                                content: Text('Points: $winner points'),
                                actions: [
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Ok'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        total = 0;
                                        winner = 0;
                                        winn = 0;
                                        dice1 = 0;
                                        dice2 = 0;
                                        dice3 = 0;
                                        dice4 = 0;
                                        limit = 10;
                                        left = 1;
                                        right = 1;
                                        Bleft = 1;
                                        Bright = 1;
                                        dice1count = 0;
                                        dice2count = 0;
                                        dice3count = 0;
                                        dice4count = 0;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Restart'),
                                  ),
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (BuildContext) {
                                  return alert;
                                },
                              );
                            }
                          });
                        },
                        child: Image.asset('images/dice$right.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 440.0,
                height: 20.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'S.no',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 440.0,
                          height: 20.0,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Dice 1',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Dice 2',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Dice 3',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Dice 4',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 440.0,
                          height: 20.0,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Clicks',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 440.0,
                          height: 20.0,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$dice1count',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$dice2count',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$dice3count',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$dice4count',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 440.0,
                          height: 20.0,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '|\t',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Points',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 440.0,
                          height: 20.0,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$dice1',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$dice2',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$dice3',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$dice4',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
