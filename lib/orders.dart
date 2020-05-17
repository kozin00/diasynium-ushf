import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Orders",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        backgroundColor: Color(0xFF011627),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: ordersList.length,
            itemBuilder: (context, index) {
              return Container(
                child: Material(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset(
                              "images/${ordersList[index].image}",
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 200,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(ordersList[index].name,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("\$${ordersList[index].price}",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Option: ${ordersList[index].option}",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        )),
                                    SizedBox(
                                     width: 30,
                                    ),
                                    Text("Quantity: ${ordersList[index].quantity}",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        )),
                                  ],
                                )

                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

List<OrdersClass> ordersList = [
  OrdersClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99,
      quantity: 2,
      option: "M"),
  OrdersClass(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99,
      quantity: 2,
      option: "M"),
  OrdersClass(
      image: 'Country_Life_Daily_Total_One_Iron_free_60_vegan.PNG',
      name: 'Country Life Daily Total One Iron Free 60 Vegan',
      price: 11.99,
      quantity: 2,
      option: "M"),
  OrdersClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99,
      quantity: 2,
      option: "M"),
];

class OrdersClass {
  final String image;
  final String name;
  final double price;
  final int quantity;
  final String option;
  String id;

  OrdersClass({this.name, this.image, this.price, this.option, this.quantity});
}
