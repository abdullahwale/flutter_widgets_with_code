import 'package:flutter/material.dart';
import 'package:todoapp_commit_by_commit/model/todo_item.dart';
import 'package:todoapp_commit_by_commit/util/database_client.dart';

class todoScreen extends StatefulWidget {
  @override
  _todoScreenState createState() => _todoScreenState();
}

class _todoScreenState extends State<todoScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  var db = new DatabaseHelper();
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
              _handleSubmitted(_textEditingController.text);
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

  void _handleSubmitted(String text) async {
    _textEditingController.clear();
    todo_item item = todo_item(text, DateTime.now().toIso8601String());
    int savedItem = await db.saveItem(item);
    print(savedItem);
  }
}
