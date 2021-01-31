import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/pages/home_page.dart';
import 'package:flutter_ecommerce_app/src/pages/processing_page.dart';
import 'package:flutter_ecommerce_app/src/pages/product_add_detail_page.dart';
import 'package:flutter_ecommerce_app/src/pages/shoping_cart_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/wigets/BottomNavigationBar/bootom_navigation_bar.dart';
import 'package:flutter_ecommerce_app/src/wigets/prduct_icon.dart';
import 'package:flutter_ecommerce_app/src/wigets/product_card.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';
import 'package:flutter_ecommerce_app/src/pages/template_detail.dart';
import 'package:flutter_ecommerce_app/src/model/list_template.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;
  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // FlatButton(
          //   onPressed: ()
          // {
          //   Scaffold.of(context).openDrawer();
          // },
          //     child: RotatedBox(
          //       quarterTurns: 4,
          //       child: _icon(Icons.sort, color: Colors.black54),
          //     ),
          // ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff8f8f8),
                      blurRadius: 10,
                      spreadRadius: 10),
                ],
              ),
              child: Image.asset("assets/user.png"),
            ),
          )
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }



  Widget _title() {
    return Container(
        margin: AppTheme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // TitleText(
                //   text: isHomePageSelected ? 'Your' : 'Your',
                //   fontSize: 27,
                //   fontWeight: FontWeight.w400,
                // ),
                TitleText(
                  text: isHomePageSelected ? 'Templates' : 'Products',
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            !isHomePageSelected
                ? Container()
                : FlatButton(
                    //color: Colors.white,
                    textColor: Colors.blue,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      /*...*/
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => SecondRoute()),
                      // );
                      AlertDialog alert = AlertDialog(
                        title: Text("Name of product's template"),
                        content: Container(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  border: new UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  hintText: 'Sneakers',
                                ),
                                //controller: nameController,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Example: shoes",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            ],
                          ),
                        ),
                        actions: [
                          FlatButton(
                            child: Text("Cancel",style: TextStyle(
                              color: Colors.red
                            ),),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text(
                              "Ok",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondRoute()),
                              );
                            },
                          ),
                        ],
                      );

                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Text(
                      "+ Add",
                      style: TextStyle(fontSize: 20.0, color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ));
  }

  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff8f8f8),
                      blurRadius: 10,
                      spreadRadius: 10),
                ],
              ),
              child: Image.asset("assets/user.png"),
            )
          ]),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Admin',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Dashboard',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Template',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                onBottomIconPressed(1);
              },
            ),
            ListTile(
              title: Text(
                'Product',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                onBottomIconPressed(2);
              },
            ),
            ListTile(
              title: Text(
                'Import file',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProcessPage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Help',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0xfffbfbfb),
                    Color(0xfff7f7f7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _title(),
                    Expanded(
                        child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            switchInCurve: Curves.easeInToLinear,
                            switchOutCurve: Curves.easeOutBack,
                            child: isHomePageSelected
                                ? MyHomePage()
                                : Align(
                                    alignment: Alignment.topCenter,
                                    child: ShopingCartPage(),
                                  )))
                  ],
                ),
              ),
            ),
            // Positioned(
            //     bottom: 0,
            //     right: 0,
            //     child: CustomBottomNavigationBar(
            //       onIconPresedCallback: onBottomIconPressed,
            //     ))
          ],
        ),
      ),
    );
  }
}
