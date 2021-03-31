import 'package:flutter/material.dart';

class todoScreen extends StatefulWidget {
  @override
  _todoScreenState createState() => _todoScreenState();
}

class _todoScreenState extends State<todoScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(),
      floatingActionButton: new FloatingActionButton(
          tooltip: "Add Item",
          backgroundColor: Colors.redAccent,
          child: new ListTile(
            title: new Icon(Icons.add),
          ),
          onPressed: _showFormDialog),
    );
  }

  void _showFormDialog() {
    //print("FLoating Action button");
    var alert = AlertDialog(
      content: Row(
        children: [
          Expanded(
              child: TextField(
            controller: null,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "Item",
              hintText: "Enter your Item!",
              icon: Icon(Icons.note_add),
            ),
          )),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              //_handleSubmitted(_textEditingController.text);
              _textEditingController.clear();
              Navigator.pop(context);
            },
            child: Text("Save")),
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel"))
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
}
