import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      children: <Widget>[
        FlatButton(child: Text("click me"), onPressed: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },),

        _isExpanded ? Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
        ) : Container()
      ],
    ));
  }
}
