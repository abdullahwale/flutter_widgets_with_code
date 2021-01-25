import 'package:flutter/material.dart';

void main() {
  // Displays build timeline
  debugProfileBuildsEnabled = true;
  runApp(GlobalKeyWidget());
}

class WidgetsWithKeysAreJustUpdated extends StatefulWidget {
  @override
  _WidgetsWithKeysAreJustUpdatedState createState() =>
      _WidgetsWithKeysAreJustUpdatedState();
}

class _WidgetsWithKeysAreJustUpdatedState
    extends State<WidgetsWithKeysAreJustUpdated> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        value
            ? const SizedBox(key: ValueKey('SizedBox'))
            : const Placeholder(key: ValueKey('Placeholder')),
        GestureDetector(
          key: ValueKey('GestureDetector'),
          onTap: () {
            setState(() {
              value = !value;
            });
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
        !value
            ? const SizedBox(key: ValueKey('SizedBox'))
            : const Placeholder(key: ValueKey('Placeholder')),
      ],
    );
  }
}

class GlobalKeyWidget extends StatefulWidget {
  @override
  _GlobalKeyWidgetState createState() => _GlobalKeyWidgetState();
}

class _GlobalKeyWidgetState extends State<GlobalKeyWidget> {
  bool value = false;
  final global = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final inner = MaterialApp(
      key: global,
      home: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
        });
      },
      child: value ? SizedBox(child: inner) : inner,
    );
  }
}
