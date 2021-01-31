import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/processing_page.dart';
import 'package:flutter_ecommerce_app/src/pages/result_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';

class ImportPage extends StatefulWidget {
  @override
  _ImportPage createState() => _ImportPage();

}

class _ImportPage extends State<ImportPage> {
  bool _isExpanded = false;


  double _progress = 0;
  int _percent =0;
  double _file=0;

  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
          (Timer timer) => setState(
            () {
              if(_progress >= 1)
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage()),
                );
                // _progress=-1;
                timer.cancel();
                _progress=0;
              } else {
            _progress += 0.2;
            _percent+=20;
            _file+=100;
          }
        },
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(
            text: "Import file",
            fontSize: 25,
            color: LightColor.titleTextColor,
          ),
          Row(
            children: <Widget>[Icon(Icons.error_outline), Text("Instructions")],
          ),
          SizedBox(
            height: 30,
          ),
          Center(child:
          Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  strokeWidth:30,
                  backgroundColor: Colors.grey,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue[400]),
                  value: _progress,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(60,70,0,0),
                child: Column(
                  children: [
                    Text("$_percent % ", style: TextStyle(fontSize: 15),),
                    Text("$_file /500MB ", style: TextStyle(fontSize: 15),),
                  ],
                )
              ),
            ],
          )
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(40),
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      _progress = 0;
                    });
                    startTimer();
                  },
                  child: Text("Import",
                    style: TextStyle(
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProcessPage()),
                    );
                  },
                  child: Text("Cancel",
                    style: TextStyle(
                        color: Colors.red[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    )));
  }
}
