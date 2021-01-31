import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/product_get_done_page.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';

import 'get_done_page.dart';


final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];



class AddDetail extends StatefulWidget {
  @override
  _AddDetail createState() => _AddDetail();
}

class _AddDetail extends State<AddDetail> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Template: Sneaker"),
        actions: [
          FlatButton(
            child: Container(
              color: Colors.white24,
              child: Icon(Icons.done),
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetDoneProduct()),
              );
            },
          )
        ],
      ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 550,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  children: <Widget>[
                   SingleChildScrollView(
                     child:  Container(
                         //height: 400,
                         //color: Colors.amber[600],
                         decoration: BoxDecoration(
                             border: Border(
                               bottom:BorderSide(width: 2,color: Colors.blueGrey),
                             )
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             SizedBox(height: 10,),
                             Text("Basic info",
                               style: TextStyle(
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold
                               ),
                             ),
                             SizedBox(height: 10,),
                             TextField(
                               decoration: InputDecoration(
                                 border: new UnderlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.teal)
                                 ),
                                 hintText: 'Product name (Ex: Air Jordan)',
                               ),
                             ),
                             SizedBox(height: 10,),
                             TextField(
                               decoration: InputDecoration(
                                 border: new UnderlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.teal)
                                 ),
                                 hintText: 'Category (Ex: Shoe)',
                               ),
                             ),
                             SizedBox(height: 10,),
                             TextField(
                               decoration: InputDecoration(
                                 border: new UnderlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.teal)
                                 ),
                                 hintText: 'Base price (Ex: 100USD)',
                               ),
                             ),
                             SizedBox(height: 10,),
                             TextField(
                               decoration: InputDecoration(
                                 border: new UnderlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.teal)
                                 ),
                                 hintText: 'Retail price (Ex: 99USD)',
                               ),
                             ),
                             SizedBox(height: 10,),
                             TextField(
                               decoration: InputDecoration(
                                 border: new UnderlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.teal)
                                 ),
                                 hintText: 'Unit of measurement (Ex: ...)',
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("Details",
                               style: TextStyle(
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("Description",
                               style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w300
                               ),
                             ),
                             Container(
                               height: 100,
                               child:  TextField(
                                 maxLength:400,
                                 maxLines: 8,
                                 decoration: InputDecoration(
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                   labelText: "Write your product's description here",
                                   isDense: true,                      // Added this
                                 ),
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("Title",
                               style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w300
                               ),
                             ),
                             Container(
                               height: 70,
                               child:  TextField(
                                 decoration: InputDecoration(
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                   labelText: "Text",
                                   isDense: true,                      // Added this
                                 ),
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("Media",
                               style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w300
                               ),
                             ),
                             Container(
                               height: 200,
                               decoration: BoxDecoration(
                                 //color: Colors.blue[50],
                                 border: Border.all(
                                     color: Colors.grey
                                 ),
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child: Center(
                                 child: IconButton(
                                   onPressed: (){

                                   },
                                   iconSize: 100,
                                   icon: Icon(Icons.add_circle),
                                 ),
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("Date",
                               style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w300
                               ),
                             ),
                             Container(
                               height: 80,
                               decoration: BoxDecoration(
                                 //color: Colors.blue[50],
                                 border: Border.all(
                                     color: Colors.grey
                                 ),
                                 borderRadius: BorderRadius.circular(10),
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("Add product's image:",
                               style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w300
                               ),
                             ),
                             Container(
                               height: 200,
                               decoration: BoxDecoration(
                                 //color: Colors.blue[50],
                                 border: Border.all(
                                     color: Colors.grey
                                 ),
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child: Center(
                                 child: IconButton(
                                   onPressed: (){

                                   },
                                   iconSize: 100,
                                   icon: Icon(Icons.add_circle),
                                 ),
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("Your uploaded picture",
                               style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w300
                               ),
                             ),
                             Row(
                               children: [
                                 Container(
                                   height: 110,
                                   width: 110,
                                   child: Image.asset('assets/show_1.png',
                                   fit: BoxFit.fill,
                                   ),
                                 ),
                                 SizedBox(width: 10,),
                                 Container(
                                   height: 110,
                                   width: 110,
                                   child: Image.asset('assets/show_1.png',
                                     fit: BoxFit.fill,
                                   ),
                                 ),
                                 SizedBox(width: 10,),
                                 Container(
                                   height: 110,
                                   width: 110,
                                   child: Image.asset('assets/show_1.png',
                                     fit: BoxFit.fill,
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: 10,),
                           ],
                         )
                     ),
                   )
                  ],
                )
              )
            ],
          )
        ),
    );
  }
}

Widget _appBar(BuildContext context) {
  return Container(
    padding: AppTheme.padding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.arrow_back_ios),
        SizedBox(width: 10,),
        TitleText(text: "Back", fontSize: 20),
        SizedBox(width: 190,),
        FlatButton(
          child: Container(
            color: Colors.white24,
            child: Icon(Icons.done),
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GetDoneProduct()),
            );
          },
        )
      ],
    ),
  );
}