import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/category.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/pages/get_done_page.dart';
import 'package:flutter_ecommerce_app/src/pages/home_page.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:flutter_ecommerce_app/src/pages/shoping_cart_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/wigets/prduct_icon.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';

class GetDoneProduct extends StatefulWidget {
  GetDoneProduct({Key key}) : super(key: key);

  @override
  _GetDoneProduct createState() => _GetDoneProduct();
}

class _GetDoneProduct extends State<GetDoneProduct> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.arrow_back_ios),
          SizedBox(width: 20,),
          TitleText(text: "Back to edit", fontSize: 20),
          SizedBox(width: 110,),
          FlatButton(
            child: Container(
              color: Colors.white24,
              child: Icon(Icons.done),
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _iconDone(){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 150,
      width: 150,
      alignment: Alignment.center,
      child: new Icon(Icons.cloud_done_outlined,color: Colors.green , size: 150),
    );
  }
  Widget _text(){
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Text(
        "Succeeded adding",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _sizeWidget() {
    return Container(
      height: 320,
      width:  MediaQuery.of(context).size.width-40,
      color: Colors.grey,
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          FlatButton(
            child: Container(
              color: Colors.white24,
              child: Icon(Icons.done),
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfffbfbfb),
                    Color(0xfff7f7f7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    _iconDone(),
                    _text(),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
