//import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/pages/processing_page.dart';
import 'package:flutter_ecommerce_app/src/pages/product_add_detail_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/wigets/prduct_icon.dart';
import 'package:flutter_ecommerce_app/src/wigets/product_card.dart';
import 'package:flutter_ecommerce_app/src/wigets/title_text.dart';

import 'import_file_page.dart';

class ShopingCartPage extends StatelessWidget {
  const ShopingCartPage({Key key}) : super(key: key);

  Widget _cartItems() {
    return Column(children: AppData.cartList.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: LightColor.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: -20,
                  bottom: -20,
                  child: Image.asset(model.image),
                )
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: model.name,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      TitleText(
                        text: '\$ ',
                        color: LightColor.red,
                        fontSize: 12,
                      ),
                      TitleText(
                        text: model.price.toString(),
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: LightColor.lightGrey.withAlpha(150),
                        borderRadius: BorderRadius.circular(10)),
                    child: TitleText(
                      text: 'x${model.id}',
                      fontSize: 12,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: '${AppData.cartList.length} Items',
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        TitleText(
          text: '\$${getPrice()}',
          fontSize: 18,
        ),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: LightColor.orange,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: AppTheme.fullWidth(context) * .7,
          child: TitleText(
            text: 'Next',
            color: LightColor.background,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }
  Widget _categoryWidget(BuildContext context) {
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

  Widget _productWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .5,
      child: GridView(
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
              .toList()),
    );
  }

  Widget _search() {
    return Container(
      //margin: AppTheme.padding,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search for template or product name",
                    hintStyle: TextStyle(fontSize: 16),
                    contentPadding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: _search()
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Recent Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            _productWidget(context),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child:  Text(
                "Choose A Template",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),

              width: AppTheme.fullWidth(context),
              height: AppTheme.fullWidth(context) * .7,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                children: <Widget>[
                  InkWell(
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
                              spreadRadius:2,
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
                                Icon(Icons.auto_fix_high,color: Colors.black,)
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
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddDetail()),
                      );
                    },
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
                              Icon(Icons.auto_fix_high,color: Colors.black,)
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
                            spreadRadius: 5,
                            blurRadius: 7,
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
                              Text("Watch",

                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 237,),
                              Icon(Icons.auto_fix_high,color: Colors.black,)
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
              ),
            ),
            //_categoryWidget(context),
            //_cartItems(),
            Divider(
              thickness: 1,
              height: 70,
            ),
            //_price(),
            SizedBox(height: 30),
            //_submitButton(context),
          ],
        ),
      ),
    );
  }
}
