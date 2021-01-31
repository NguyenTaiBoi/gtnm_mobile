import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/product_get_done_page.dart';
import 'package:flutter_ecommerce_app/src/pages/product_list_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';

import 'get_done_page.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPage createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Icon(Icons.arrow_forward, color: Colors.blue,),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetDoneProduct()),
              );
            },
          ),
        ],
      ),
        body: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.done_all,size: 40,color: Colors.green,),
                        Text("\tImport successfully\n 12 attributes, 50 items loaded",
                          style: TextStyle(
                            color: Colors.green[300],
                              fontSize: 20),

                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.insert_drive_file,size: 40,),
                          //SizedBox(width: 100,),
                          Text("\tprd.csv",style: TextStyle(fontSize: 20, color: Colors.grey),),
                          SizedBox(width: 130,),
                          Text("Change",style: TextStyle(fontSize: 20, color: Colors.grey),)
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: <Widget>[
                      Center(
                          child: Container(
                            height: 40,
                            child: FlatButton(
                              color: Colors.blue[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text("Review all the products",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),),
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProductList())
                                );
                              },
                            ),
                          )
                        ),
                    ],
                  )
                ],
              ),
            )));
  }
}

Widget _appBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top:20,bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 20,
          child: FlatButton(
            child: Icon(Icons.arrow_back, color: Colors.blue,),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetDoneTemplate()),
              );
            },
          ),
        ),
        SizedBox(width: 30,),
        TitleText(text: "Back", fontSize: 20, color: Colors.blue,),
        SizedBox(width: 150,),
        TitleText(text: "Proceed", fontSize: 20, color: Colors.blue,),
        Container(
          width: 20,
          child: FlatButton(
            child: Icon(Icons.arrow_forward, color: Colors.blue,),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetDoneProduct()),
              );
            },
          ),
        )
      ],
    ),
  );
}