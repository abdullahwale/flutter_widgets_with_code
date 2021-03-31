import 'package:flutter/material.dart';

class todo_item extends StatelessWidget {
  String _itemName;
  String _dateCreated;
  int _id;
  todo_item(this._itemName, this._dateCreated);
// Adding another Contructor for handling single database item
  todo_item.map(dynamic obj) {
    this._itemName = obj["itemName"];
    this._dateCreated = obj["dateCreated"];
    this._id = obj["id"];
  }

  String get itemName => _itemName;
  String get dateCreated => _dateCreated;
  int get id => _id;

// Maping the value in database class
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["itemName"] = _itemName;
    map["dateCreated"] = _dateCreated;

    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  /// recive data in map from the obect
  todo_item.fromMap(Map<String, dynamic> map) {
    this._itemName = map["itemName"];
    this._dateCreated = map["dateCreated"];
    this._id = map["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /// Add row model in the conatiner
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _itemName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.9),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Created on: $_dateCreated",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.5,
                      fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

/// only minus sign on hte row is remaining in this file
