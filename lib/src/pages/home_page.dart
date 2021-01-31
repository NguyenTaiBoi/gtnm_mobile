import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/pages/template_detail.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/wigets/BottomNavigationBar/bootom_navigation_bar.dart';
import 'package:flutter_ecommerce_app/src/wigets/prduct_icon.dart';
import 'package:flutter_ecommerce_app/src/wigets/product_card.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ecommerce_app/src/model/list_template.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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


  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: AppData.categoryList
              .map((category) => ProducIcon(
                    model: category,
                  ))
              .toList()),
    );
  }

  final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2];
  TextEditingController nameController = TextEditingController();


  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      msgCount.insert(0, 0);
    });
  }

  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),

      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child:
      ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondRoute()),
              );
            },
            child: Container(
                height: 80,
                //color: Colors.amber[600],
                //color: Colors.blueGrey,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 30,),
                        Text("Clothing",

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 225,),
                        Icon(Icons.create,color: Colors.black,)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 30,),
                        Text("12 products in use",
                          style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 150,),
                      ],
                    )
                  ],
                )
            ),
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (context) => SecondRoute()),
              );
            },
            child: Container(
                height: 80,
                //color: Colors.amber[600],
                //color: Colors.blueGrey,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 30,),
                        Text("Sneaker",

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 225,),
                        Icon(Icons.create,color: Colors.black,)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 30,),
                        Text("12 products in use",
                          style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 150,),
                      ],
                    )
                  ],
                )
            ),
          ),
          SizedBox(height: 15,),
          Container(
              height: 80,
              //color: Colors.amber[600],
              //color: Colors.blueGrey,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 30,),
                      Text("Watch",

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 237,),
                      Icon(Icons.create,color: Colors.black,)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 30,),
                      Text("12 products in use",
                        style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 150,),
                    ],
                  )
                ],
              )
          ),
        ],
      )
      /*GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4 / 3,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20),
          padding: EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          children: AppData.productList
              .map((product) => ProductCard(
                    product: product,
                  ))
              .toList()),*/
    );
  }
  Widget _recentTitle(){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      width: AppTheme.fullWidth(context),
      height: 20,
      child: Text(
        'Recent product template',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }



  Widget _recentTemplate(){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      width: AppTheme.fullWidth(context),
      height: 20,
      child: Text(
        'Recommended template:',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_recentTemplate(),_categoryWidget(),_recentTitle(), _productWidget()],
      );
  }
}
