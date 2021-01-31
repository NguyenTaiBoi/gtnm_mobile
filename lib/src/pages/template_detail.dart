import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/category.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/pages/get_done_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/wigets/prduct_icon.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';

class SecondRoute extends StatefulWidget {
  SecondRoute({Key key}) : super(key: key);

  @override
  _SecondRoute createState() => _SecondRoute();
}

bool _isText = false;
bool _isMedia = false;
bool _isDate = false;
bool _isImage = false;
bool _isColor = false;

class _SecondRoute extends State<SecondRoute> with TickerProviderStateMixin {
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

  Widget _availableSize() {
    return Container(
      padding: EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey),
      // ),
      height: 207,
      width: MediaQuery.of(context).size.width - 40,
      color: Colors.white70,
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey),
      //   borderRadius: BorderRadius.circular(12)
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(
            text: "Tap to add component:",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _sizeWidget(
                    "Text",
                    IconButton(
                      icon: Icon(Icons.text_fields),
                      onPressed: () {
                        setState(() {
                          _isText = true;
                        });
                      },
                    ),
                    Colors.blueGrey
                  ),
                  _sizeWidget(
                      "Media",
                      IconButton(
                        icon: Icon(Icons.perm_media),
                        onPressed: () {
                          setState(() {
                            _isMedia = true;
                          });
                        },
                      ),
                      Colors.blueGrey
                  ),

                  _sizeWidget(
                      "Date",
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          setState(() {
                            _isDate = true;
                          });
                        },
                      ),
                      Colors.blueGrey
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _sizeWidget(
                    "Image",
                    IconButton(
                      icon: Icon(Icons.image),
                      onPressed: () {
                        setState(() {
                          _isImage = true;
                        });
                      },
                    ),
                      Colors.blueGrey
                  ),
                  _sizeWidget(
                      "Color",
                      IconButton(
                        icon: Icon(Icons.color_lens),
                        onPressed: () {
                          setState(() {
                            _isColor = true;
                          });
                        },
                      ),
                      Colors.blueGrey),
                  _sizeWidget(
                      "",
                      IconButton(
                          icon: Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.blue[400],
                      )),
                      Colors.blue[400]
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: <Widget>[
              //     _sizeWidget("Calendar",Icon(Icons.calendar_today)),
              //     _sizeWidget("Location", Icon(Icons.text_fields)),
              //   ],
              // ),
            ],
          )
        ],
      ),
    );
  }

  bool _isExpanded = true;
  bool _isExpandedDetail = true;
  bool _isTextEx = false;
  bool _isMediaEx = false;
  bool _isDateEx = false;
  bool _isImageEx = false;
  bool _isColorEx = false;
  Widget _elementList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 00, 0),
          child: FlatButton(
            textColor: Colors.black,
            color: Colors.red[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Basic information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                  ),
                ),
                SizedBox(width: 145,),
                Icon(_isExpanded?Icons.arrow_drop_up:Icons.arrow_drop_down,
                  color: Colors.red[700],
                  size: 40,),
              ],
            ),
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
        ),
        _isExpanded
            ? Container(
                height: 420,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: MediaQuery.of(context).size.width - 40,
                color: Colors.white24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Name of Product',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Base Price',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Retail Price',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Unit of measurement',
                        ),
                      ),
                    ),Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Description',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Image',
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _textList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: FlatButton(
            color: Colors.white,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Text",
                  style: TextStyle(fontSize: 20,),
                ),
                SizedBox(width: 228),
                Icon(Icons.arrow_drop_down),
                IconButton(
                  iconSize: 20,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isText = false;
                    });
                  },
                )
              ],
            ),
            onPressed: () {
              setState(() {
                _isTextEx = !_isTextEx;
              });
            },
          ),
        ),
        _isTextEx
            ? Container(
                height: 210,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: MediaQuery.of(context).size.width - 40,
                color: Colors.white24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Title',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Text Hint',
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _MediaList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: FlatButton(
            color: Colors.white,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Media",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 210),
                Icon(Icons.arrow_drop_down),
                IconButton(
                  iconSize: 20,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isMedia = false;
                    });
                  },
                )
              ],
            ),
            onPressed: () {
              setState(() {
                // _isTextEx = !_isTextEx;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _dateList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: FlatButton(
            color: Colors.white,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Date",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 222),
                Icon(Icons.arrow_drop_down),
                IconButton(
                  iconSize: 20,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isDate = false;
                    });
                  },
                )
              ],
            ),
            onPressed: () {
              setState(() {
                // _isTextEx = !_isTextEx;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _ImageList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: FlatButton(
            color: Colors.white,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Image",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 208),
                Icon(Icons.arrow_drop_down),
                IconButton(
                  iconSize: 20,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isImage = false;
                    });
                  },
                )
              ],
            ),
            onPressed: () {
              setState(() {
                // _isTextEx = !_isTextEx;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _ColorList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: FlatButton(
            color: Colors.white,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Color",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 218),
                Icon(Icons.arrow_drop_down),
                IconButton(
                  iconSize: 20,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isColor = false;
                    });
                  },
                )
              ],
            ),
            onPressed: () {
              setState(() {
                // _isTextEx = !_isTextEx;
              });
            },
          ),
        ),
      ],
    );
  }

  String dropdownValue = 'Sneakers';

  Widget _appBar() {
    //String dropdownValue = 'One';
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 80,
          ),
          // TitleText(text: "SNEAKERS", fontSize: 20),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.red[400],
            ),

            iconSize: 24,
            elevation: 16,
            style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                AlertDialog alert = AlertDialog(
                  title: Text("Your work can be lost"),
                  content: Text("Do you want to keep this draft?"),
                  actions: [
                    FlatButton(
                      child: Text("Discard", style: TextStyle(color: Colors.red),),
                      onPressed: () {
                        setState(() {
                          _isColor = false;
                          _isText = false;
                          _isDate = false;
                          _isMedia = false;
                          _isImage = false;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text("Keep",style: TextStyle(color: Colors.red),),
                      onPressed: () {
                        Navigator.of(context).pop();
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
              });
            },
            items: <String>['Sneakers', 'Jacket', 'Watch', 'Food']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,),
              );
            }).toList(),
          ),
          SizedBox(
            width: 60,
          ),
          FlatButton(
            child:  Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetDoneTemplate()),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _sizeWidget(String text, IconButton iconButton, Color _color,
      {Color color = LightColor.iconColor, bool isSelected = false}) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
              color: _color,
              style: !isSelected ? BorderStyle.solid : BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: isSelected
              ? LightColor.orange
              : Theme.of(context).backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TitleText(
              text: text,
              fontWeight: FontWeight.w300,
              fontSize: 17,
              color: isSelected
                  ? LightColor.background
                  : LightColor.titleTextColor,
            ),
            iconButton,
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
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
                child: Stack(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        _appBar(),
                        //SizedBox(height: 5,),
                        /*    _productImage(),
                  _categoryWidget(),*/
                        _availableSize(),
                        _elementList(),
                        // Row(
                        //   children: <Widget>[
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //     Text(
                        //       "Details:",
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 00, 0),
                          child: FlatButton(
                            textColor: Colors.black,
                            color: Colors.red[100],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Details",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                                    color: Colors.red[700],
                                  ),
                                ),
                                SizedBox(width: 240,),
                                Icon(_isExpandedDetail?Icons.arrow_drop_up:Icons.arrow_drop_down,
                                color: Colors.red[700],
                                size: 40,),
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                _isExpandedDetail = !_isExpandedDetail;
                              });
                            },
                          ),
                        ),
                        _isExpandedDetail ? Container(
                          height: 400,
                          child: Column(
                            children: [
                              _isText ? _textList() : Container(),
                              _isMedia ? _MediaList() : Container(),
                              _isDate ? _dateList() : Container(),
                              _isImage ? _ImageList() : Container(),
                              _isColor ? _ColorList() : Container(),
                            ],
                          ),
                        ): Container(),

                      ],
                    ),
                    //_detailWidget()
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
