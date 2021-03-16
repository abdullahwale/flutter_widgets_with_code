import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(UI());
}

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            _top(),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200.0,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                ),
                children: [
                  _gridItem(Icons.airport_shuttle),
                  _gridItem(Icons.add_shopping_cart_sharp),
                  _gridItem(Icons.arrow_circle_down_outlined),
                  _gridItem(Icons.add_location),
                  _gridItem(Icons.arrow_circle_down_rounded),
                  _gridItem(Icons.arrow_circle_down_rounded),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    "Latest",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            _cardItem(1),
            _cardItem(2),
            _cardItem(3),
            _cardItem(4),
          ],
        ),
      ),
    );
  }
}

_cardItem(image) {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Row(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sister's Graduation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "15 Items",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    ),
  );
}

_gridItem(IconData icon) {
  return Column(
    children: [
      CircleAvatar(
        child: Icon(
          Icons.arrow_circle_down_rounded,
          size: 16.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange.withOpacity(0.9),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        "BirtDay",
        style: TextStyle(
          fontSize: 11.0,
        ),
      ),
    ],
  );
}

_top() {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Hi Abdullah",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
                icon: Icon(
                  Icons.notification_important,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        SizedBox(height: 30.0),
        TextField(
          decoration: InputDecoration(
            hintText: "Search",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Icon(Icons.filter_list),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          ),
        )
      ],
    ),
  );
}
