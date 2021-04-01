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
  final List<todo_item> _itemList = <todo_item>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readNoDoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.all(0.0),
                  reverse: false,
                  itemCount: _itemList.length,
                  itemBuilder: (_, int index) {
                    return Card(
                      color: Colors.white10,
                      child: ListTile(
                        title: _itemList[index],
                        onLongPress: () => debugPrint(""),
                        trailing: Listener(
                          key: Key(_itemList[index].itemName),
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.redAccent,
                          ),
                          onPointerDown: (pointEvent) => debugPrint(""),
                        ),
                      ),
                    );
                  })),
          Divider(
            height: 1.0,
          )
        ],
      ),
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
    todo_item addedItem = await db.getItem(savedItem);
    setState(() {
      _itemList.insert(0, addedItem);
    });
    print(savedItem);
  }

  void _readNoDoList() async {
    List items = await db.getItems();
    items.forEach((item) {
      //todo_item noDoItem = todo_item.fromMap(item);
      setState(() {
        _itemList.add(todo_item.map(item));
      });
      //print("Db items: ${noDoItem.itemName}");
    });
  }
}
