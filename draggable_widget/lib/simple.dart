import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drag and Drop Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Drag and Drop Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Draggable(
                child: buildBox("+1", Colors.red[200]),
                feedback: buildBox("+1", Colors.red[200]),
                childWhenDragging: buildBox("+1", Colors.grey[300]),
                data: 1,
                onDragStarted: () {
                  print("onDragStarted");
                },
                onDragCompleted: () {
                  print("onDragCompleted");
                },
                onDragEnd: (details) {
                  print("onDragEnd Accept = " + details.wasAccepted.toString());
                  print("onDragEnd Velocity = " +
                      details.velocity.pixelsPerSecond.distance.toString());
                  print("onDragEnd Offeset= " +
                      details.offset.direction.toString());
                },
                onDraggableCanceled: (Velocity velocity, Offset offset) {
                  print("onDraggableCanceled " + velocity.toString());
                },
              ),
              Draggable(
                child: buildBox("-1", Colors.blue[200]),
                feedback: buildBox("-1", Colors.blue[200]),
                childWhenDragging: buildBox("-1", Colors.blue[300]),
                data: -1,
              )
            ]),
            DragTarget(
              builder: (BuildContext context, List<int> candidateData,
                  List<dynamic> rejectedData) {
                print("candidateData = " +
                    candidateData.toString() +
                    " , rejectedData = " +
                    rejectedData.toString());
                return buildBox("$count", Colors.green[200]);
              },
              onWillAccept: (data) {
                print("onWillAccept");
                return data == 1 || data == -1; // accept when data = 1 only.
              },
              onAccept: (data) {
                print("onAccept");
                count += data;
              },
              onLeave: (data) {
                print("onLeave");
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container buildBox(String title, Color color) {
    return Container(
        width: 100,
        height: 100,
        color: color,
        child: Center(
            child: Text(title,
                style: TextStyle(fontSize: 18, color: Colors.black))));
  }
}
