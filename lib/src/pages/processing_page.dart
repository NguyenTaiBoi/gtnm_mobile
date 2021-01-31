import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/result_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';

import 'import_file_page.dart';

class ProcessPage extends StatefulWidget {
  @override
  _ProcessPage createState() => _ProcessPage();
}

class _ProcessPage extends State<ProcessPage> {
  bool _isExpanded = false;

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
                    height: 10,
                  ),
                  Text(
                    "Choose file from your device (.csv or .xlsx)",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: <Widget>[
                    SizedBox(width: 130,),
                    Icon(Icons.insert_drive_file,size: 100,),
                    Text(".csv",style: TextStyle(fontSize: 20, color: Colors.grey),),
                  ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color(0xfff8f8f8),
                              blurRadius: 15,
                              spreadRadius: 10)
                        ]),
                    child: FlatButton(
                      color: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ImportPage()),
                        );
                      },
                      child: Text(
                        "Upload from device",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
