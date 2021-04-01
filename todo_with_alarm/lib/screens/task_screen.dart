import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_with_alarm/helpers/db_helper.dart';
import 'package:todo_with_alarm/models/task_model.dart';

class TaskScreen extends StatefulWidget {
  final Function updateTaskList;
  final Task task;

  TaskScreen({this.updateTaskList, this.task});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _priority = "Medium";
  DateTime _date = DateTime.now();
  int _hidden = 0;
  TextEditingController _dateController = TextEditingController();

  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  final List<String> _priorities = ['Low', 'Medium', 'High', 'Critical'];

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _title = widget.task.title;
      _date = widget.task.date;
      _priority = widget.task.priority;
      _hidden = widget.task.hidden;
    }
    _dateController.text = _dateFormatter.format(_date);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  _handleDatePicker() async {
    // ignore: todo
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  _deleteTask() {
    DBHelper.instance.deleteTask(widget.task.id);
    widget.updateTaskList();
    Navigator.pop(context, widget.task);
  }

  _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Task task = Task(
          title: _title, date: _date, priority: _priority, hidden: _hidden);
      if (widget.task == null) {
        task.status = 0;
        task.hidden = 0;
        DBHelper.instance.insertTask(task);
      } else {
        task.id = widget.task.id;
        task.status = widget.task.status;
        task.hidden = widget.task.hidden;
        DBHelper.instance.updateTask(task);
      }
      widget.updateTaskList();
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Icon(Icons.arrow_back,
                      size: 30, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 20),
                Text(
                  widget.task == null ? "Add Task" : "Update Task",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            labelText: 'Title',
                            labelStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (input) => input.trim().isEmpty
                            ? "Please enter a title"
                            : null,
                        onChanged: (value) => _title = value,
                        initialValue: _title,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            labelText: 'Due date',
                            labelStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onTap: _handleDatePicker,
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                          items: _priorities.map((String priority) {
                            return DropdownMenuItem(
                                value: priority,
                                child: Text(
                                  priority,
                                  style: TextStyle(color: Colors.black),
                                ));
                          }).toList(),
                          isDense: true,
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconSize: 20,
                          iconEnabledColor: Theme.of(context).primaryColor,
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              labelText: 'Priority',
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) =>
                              value == null ? "Please select a priority" : null,
                          value: _priority,
                          onChanged: (value) {
                            setState(() {
                              _priority = value;
                            });
                          }),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 40, 0.0, 20),
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: FlatButton(
                          child: Text(
                            widget.task == null ? "ADD" : "UPDATE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: _submitForm,
                        ),
                      ),
                      widget.task == null
                          ? SizedBox.shrink()
                          : Container(
                              height: 60.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: FlatButton(
                                child: Text(
                                  "DELETE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: _deleteTask,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
