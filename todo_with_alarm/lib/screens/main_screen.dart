import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_with_alarm/helpers/db_helper.dart';
import 'package:todo_with_alarm/models/task_model.dart';
import 'package:todo_with_alarm/screens/task_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<Task>> _taskList;
  int _hidden = 0;

  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DBHelper.instance.getTaskList(_hidden);
    });
  }

  Widget _createTask(Task task) {
    final Map<String, MaterialColor> _colours = {
      'Low': Theme.of(context).primaryColor,
      'Medium': Theme.of(context).primaryColor,
      'High': Theme.of(context).primaryColor,
      'Critical': Theme.of(context).primaryColor
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Dismissible(
        direction: DismissDirection.startToEnd,
        key: UniqueKey(),
        background: Container(
          alignment: AlignmentDirectional.centerStart,
          color: _hidden == 1 ? null : Theme.of(context).primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Icon(
              _hidden == 1 ? Icons.unarchive : Icons.archive,
              color:
                  _hidden == 1 ? Theme.of(context).primaryColor : Colors.white,
            ),
          ),
        ),
        onDismissed: (direction) {
          // Mark as archived/visible.
          task.hidden = 1 - _hidden;
          DBHelper.instance.updateTask(task);
          _updateTaskList();

          // Then show a snackbar.
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                  'Task "${task.title}" was ${_hidden == 1 ? 'recovered' : 'archived'}')));
        },
        child: Column(
          children: [
            ListTile(
              title: Text(task.title,
                  style: TextStyle(
                      decoration: task.status == 0
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                      fontSize: 20,
                      fontWeight: task.status == 0
                          ? FontWeight.w500
                          : FontWeight.w200)),
              subtitle: Row(
                children: [
                  // Consider a task to be overdue only starting tomorrow
                  task.date.isBefore(
                          (DateTime.now()).subtract(Duration(days: 1)))
                      ? Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            task.status == 0
                                ? Icons.alarm_add
                                : Icons.alarm_off,
                            size: 14,
                          ),
                        )
                      : SizedBox.shrink(),
                  Text(
                    '${_dateFormatter.format(task.date)}',
                    style: TextStyle(
                        decoration: task.status == 0
                            ? TextDecoration.none
                            : TextDecoration.lineThrough),
                  ),
                  Text(' • '),
                  Text('${task.priority}',
                      style: task.status == 0
                          ? TextStyle(
                              color: _colours[task.priority],
                            )
                          : TextStyle(decoration: TextDecoration.lineThrough)),
                ],
              ),
              trailing: task.hidden == 1
                  ? null
                  : Checkbox(
                      onChanged: (value) {
                        task.status = value ? 1 : 0;
                        DBHelper.instance.updateTask(task);
                        _updateTaskList();
                      },
                      activeColor: Theme.of(context).primaryColor,
                      value: task.status == 1 ? true : false),
              onTap: () => {_navigateToTheTaskScreen(context, task)},
            ),
            Divider()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _hidden == 1
          ? null
          : FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.add),
              onPressed: () {
                _navigateToTheTaskScreen(context, null);
              },
            ),
      body: FutureBuilder(
        future: _taskList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final int completedTaskCount = snapshot.data
              .where((Task task) => task.status == 1)
              .toList()
              .length;
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 70),
            itemCount: 1 + snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tasks",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _hidden = 1 - _hidden;
                            });
                            _updateTaskList();
                          },
                          icon: Icon(_hidden == 1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          color: _hidden == 1
                              ? Theme.of(context).primaryColor
                              : null),
                      IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
                      Padding(
                        padding: const EdgeInsets.only(right: 6, top: 0),
                        child: Text(
                          '$completedTaskCount of ${snapshot.data.length}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return _createTask(snapshot.data[index - 1]);
            },
          );
        },
      ),
    );
  }

  _navigateToTheTaskScreen(BuildContext context, Task task) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                TaskScreen(updateTaskList: _updateTaskList, task: task)));

    if (result is Task) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Task "${result.title}" was deleted',
              style: TextStyle(fontSize: 16)),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              DBHelper.instance.insertTask(result);
              _updateTaskList();
            },
          ),
        ));
    }
  }
}
