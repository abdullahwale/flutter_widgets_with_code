import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Dicehome(),
      '/second': (context) => Diceroll(),
      '/third': (context) => Dicerollfour(),
    },
  ));
}

class Dicehome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 160.0,
          title: Text(
            'Dicee Roll app',
            style: TextStyle(
              fontFamily: 'Wallpoet',
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(100),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0),
                side: BorderSide(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              color: Colors.deepPurple,
              height: 80.0,
              textColor: Colors.white,
              child: Text(
                '2 Players',
                style: TextStyle(
                  fontFamily: 'Wallpoet',
                  color: Colors.white,
                  fontSize: 37.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.black,
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0),
                side: BorderSide(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              color: Colors.deepPurple,
              height: 80.0,
              textColor: Colors.white,
              child: Text(
                '4 players',
                style: TextStyle(
                  fontFamily: 'Wallpoet',
                  color: Colors.white,
                  fontSize: 37.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Diceroll extends StatefulWidget {
  @override
  _DicerollState createState() => _DicerollState();
}

class _DicerollState extends State<Diceroll> {
  int total = 0;
  int winner = 0;
  int winn = 0;
  int dice1 = 0;
  int dice2 = 0;
  int limit = 10;
  int left = 1;
  int right = 1;
  int dice1count = 0;
  int dice2count = 0;
  int dicein = 1;
  void audio() {
    final player = AudioCache();
    player.play('move.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          centerTitle: true,
          toolbarHeight: 90.0,
          title: Text(
            '2 Player Dice Roll',
            style: TextStyle(
              fontFamily: 'Wallpoet',
              color: Colors.white,
              fontSize: 27.0,
            ),
          ),
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 40.0,
                height: 20.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Text(
                'Total: $total',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
              Text(
                'Limit: $limit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
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
                              if (dicein == 1) {
                                left = Random().nextInt(6) + 1;
                                dice1 = dice1 + left;
                                total = total + left;
                                audio();
                                if (left != 6) {
                                  dicein = dicein + 1;
                                  dice1count = dice1count + 1;
                                }
                              }
                            }

                            ;
                            if (dice1 > dice2) {
                              winner = dice1;
                              winn = 1;
                            } else {
                              winner = dice2;
                              winn = 2;
                            }
                            ;
                            if (dice2count >= dice1count) {
                              if (limit > 0) {
                                if (dicein == 2) {
                                  limit = limit - 1;
                                }
                              }
                            }
                            ;
                            if (dice1count == 10) {
                              if (dice2count == 10) {
                                AlertDialog alert = AlertDialog(
                                  title: Text('Congratulations\nPlayer $winn'),
                                  content: Text('You win with $winner points'),
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
                                          limit = 10;
                                          left = 1;
                                          right = 1;
                                          dice1count = 0;
                                          dice2count = 0;
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
                            }
                          });
                        },
                        child: Image.asset('images/Alea_$left.png'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(
                            () {
                              if (dice2count < 10) {
                                if (dicein == 2) {
                                  right = Random().nextInt(6) + 1;
                                  dice2 = dice2 + right;
                                  total = total + right;
                                  audio();
                                  if (right != 6) {
                                    dicein = dicein - 1;
                                    dice2count = dice2count + 1;
                                  }
                                }
                              }
                              ;

                              if (dice1count > dice2count) {
                                if (limit > 0) {
                                  if (right != 6) {
                                    if (dicein == 1) {
                                      limit = limit - 1;
                                    }
                                  }
                                }
                              }

                              ;
                              if (dice1 > dice2) {
                                winner = dice1;
                                winn = 1;
                              } else {
                                winner = dice2;
                                winn = 2;
                              }
                              ;

                              if (dice1count == 10) {
                                if (dice2count == 10) {
                                  AlertDialog alert = AlertDialog(
                                    title:
                                        Text('Congratulations\nPlayer $winn'),
                                    content:
                                        Text('You win with $winner points'),
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
                                            limit = 10;
                                            left = 1;
                                            right = 1;
                                            dice1count = 0;
                                            dice2count = 0;
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
                              }
                            },
                          );
                        },
                        child: Image.asset('images/Alea_$right.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (dice1count < 10) {
                            audio();
                            left = Random().nextInt(6) + 1;
                            dice1 = dice1 + left;
                            dice1count = dice1count + 1;
                            total = total + left;
                          }
                          ;
                          if (dice2count >= dice1count) {
                            if (limit > 0) {
                              limit = limit - 1;
                            }
                          }
                          ;
                          if (dice1 > dice2) {
                            winner = dice1;
                            winn = 1;
                          } else {
                            winner = dice2;
                            winn = 2;
                          }
                          ;

                          if (dice1count == 10) {
                            if (dice2count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Congratulations\nPlayer $winn'),
                                content: Text('You win with $winner points'),
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
                                        limit = 10;
                                        left = 1;
                                        right = 1;
                                        dice1count = 0;
                                        dice2count = 0;
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
                          }
                        });
                      },
                      color: Colors.deepPurple,
                      minWidth: 350.0,
                      height: 100.0,
                      textColor: Colors.white,
                      child: Text(
                        'Dice 1 \npoints: $dice1 \nClicks: $dice1count',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                    height: 20.0,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (dice2count < 10) {
                            audio();
                            right = Random().nextInt(6) + 1;
                            dice2 = dice2 + right;
                            dice2count++;
                            total = total + right;
                          }
                          ;
                          if (dice1count >= dice2count) {
                            if (limit > 0) {
                              limit = limit - 1;
                            }
                          }
                          ;
                          if (dice1 > dice2) {
                            winner = dice1;
                            winn = 1;
                          } else {
                            winner = dice2;
                            winn = 2;
                          }
                          ;

                          if (dice1count == 10) {
                            if (dice2count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Congratulations\nPlayer $winn'),
                                content: Text('You win with $winner points'),
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
                                        limit = 10;
                                        left = 1;
                                        right = 1;
                                        dice1count = 0;
                                        dice2count = 0;
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
                          }
                        });
                      },
                      color: Colors.deepPurple,
                      minWidth: 350.0,
                      height: 100.0,
                      textColor: Colors.white,
                      child: Text(
                        'Dice 2 \npoints: $dice2 \nClicks: $dice2count',
                        style: TextStyle(fontSize: 20.0),
                      ),
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

class Dicerollfour extends StatefulWidget {
  @override
  _DicerollfourState createState() => _DicerollfourState();
}

class _DicerollfourState extends State<Dicerollfour> {
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
  void audio() {
    final player = new AudioCache();
    player.play('move.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          centerTitle: true,
          toolbarHeight: 90.0,
          title: Text(
            '4 Player Dice Roll',
            style: TextStyle(
              fontFamily: 'Wallpoet',
              color: Colors.white,
              fontSize: 27.0,
            ),
          ),
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 40.0,
                height: 20.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Text(
                'Total: $total',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
              Text(
                'Limit: $limit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
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
                              audio();
                              Bleft = Random().nextInt(6) + 1;
                              dice1 = dice1 + Bleft;
                              dice1count = dice1count + 1;
                              total = total + Bleft;
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
                                limit = limit - 1;
                              }
                            }
                            ;
                            if (dice1count == 10 &&
                                dice2count == 10 &&
                                dice3count == 10 &&
                                dice4count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Congratulations\nPlayer $winn'),
                                content: Text('You win with $winner points'),
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
                        child: Image.asset('images/Alea_$Bleft.png'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (dice2count < 10) {
                              audio();
                              Bright = Random().nextInt(6) + 1;
                              dice2 = dice2 + Bright;
                              dice2count = dice2count + 1;
                              total = total + Bright;
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
                                limit = limit - 1;
                              }
                            }
                            ;
                            if (dice1count == 10 &&
                                dice2count == 10 &&
                                dice3count == 10 &&
                                dice4count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Congratulations\nPlayer $winn'),
                                content: Text('You win with $winner points'),
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
                        child: Image.asset('images/Alea_$Bright.png'),
                      ),
                    ),
                  ],
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
                              audio();
                              left = Random().nextInt(6) + 1;
                              dice3 = dice3 + left;
                              dice3count = dice3count + 1;
                              total = total + left;
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
                                limit = limit - 1;
                              }
                            }
                            ;
                            if (dice1count == 10 &&
                                dice2count == 10 &&
                                dice3count == 10 &&
                                dice4count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Congratulations\nPlayer $winn'),
                                content: Text('You win with $winner points'),
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
                        child: Image.asset('images/Alea_$left.png'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (dice4count < 10) {
                              audio();
                              right = Random().nextInt(6) + 1;
                              dice4 = dice4 + right;
                              dice4count = dice4count + 1;
                              total = total + right;
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
                                limit = limit - 1;
                              }
                            }
                            ;
                            if (dice1count == 10 &&
                                dice2count == 10 &&
                                dice3count == 10 &&
                                dice4count == 10) {
                              AlertDialog alert = AlertDialog(
                                title: Text('Congratulations\nPlayer $winn'),
                                content: Text('You win with $winner points'),
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
                        child: Image.asset('images/Alea_$right.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 440.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (dice1count < 10) {
                            audio();
                            Bleft = Random().nextInt(6) + 1;
                            dice1 = dice1 + Bleft;
                            dice1count = dice1count + 1;
                            total = total + Bleft;
                          }
                          ;
                          if (dice1 > dice2 && dice1 > dice3 && dice1 > dice4) {
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
                              limit = limit - 1;
                            }
                          }
                          ;
                          if (dice1count == 10 &&
                              dice2count == 10 &&
                              dice3count == 10 &&
                              dice4count == 10) {
                            AlertDialog alert = AlertDialog(
                              title: Text('Congratulations\nPlayer $winn'),
                              content: Text('You win with $winner points'),
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
                      color: Colors.deepPurple,
                      minWidth: 350.0,
                      height: 70.0,
                      textColor: Colors.white,
                      child: Text(
                        'Dice 1 \npoints: $dice1 \nClicks: $dice1count',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                    height: 20.0,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (dice2count < 10) {
                            audio();
                            Bright = Random().nextInt(6) + 1;
                            dice2 = dice2 + Bright;
                            dice2count = dice2count + 1;
                            total = total + Bright;
                          }
                          ;
                          if (dice1 > dice2 && dice1 > dice3 && dice1 > dice4) {
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
                              limit = limit - 1;
                            }
                          }
                          ;
                          if (dice1count == 10 &&
                              dice2count == 10 &&
                              dice3count == 10 &&
                              dice4count == 10) {
                            AlertDialog alert = AlertDialog(
                              title: Text('Congratulations\nPlayer $winn'),
                              content: Text('You win with $winner points'),
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
                      color: Colors.deepPurple,
                      minWidth: 350.0,
                      height: 70.0,
                      textColor: Colors.white,
                      child: Text(
                        'Dice 2 \npoints: $dice2 \nClicks: $dice2count',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 440.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (dice3count < 10) {
                            audio();
                            left = Random().nextInt(6) + 1;
                            dice3 = dice3 + left;
                            dice3count = dice3count + 1;
                            total = total + left;
                          }
                          ;
                          if (dice1 > dice2 && dice1 > dice3 && dice1 > dice4) {
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
                              limit = limit - 1;
                            }
                          }
                          ;
                          if (dice1count == 10 &&
                              dice2count == 10 &&
                              dice3count == 10 &&
                              dice4count == 10) {
                            AlertDialog alert = AlertDialog(
                              title: Text('Congratulations\nPlayer $winn'),
                              content: Text('You win with $winner points'),
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
                      color: Colors.deepPurple,
                      minWidth: 350.0,
                      height: 70.0,
                      textColor: Colors.white,
                      child: Text(
                        'Dice 3 \npoints: $dice3 \nClicks: $dice3count',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                    height: 20.0,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (dice4count < 10) {
                            audio();
                            right = Random().nextInt(6) + 1;
                            dice4 = dice4 + right;
                            dice4count = dice4count + 1;
                            total = total + right;
                          }
                          ;
                          if (dice1 > dice2 && dice1 > dice3 && dice1 > dice4) {
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
                              limit = limit - 1;
                            }
                          }
                          ;
                          if (dice1count == 10 &&
                              dice2count == 10 &&
                              dice3count == 10 &&
                              dice4count == 10) {
                            AlertDialog alert = AlertDialog(
                              title: Text('Congratulations\nPlayer $winn'),
                              content: Text('You win with $winner points'),
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
                      color: Colors.deepPurple,
                      minWidth: 350.0,
                      height: 70.0,
                      textColor: Colors.white,
                      child: Text(
                        'Dice 4 \npoints: $dice4 \nClicks: $dice4count',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 440.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
