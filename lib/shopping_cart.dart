import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uncle_sam_hf/confirmOrder.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Shopping Cart",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        backgroundColor: Color(0xFF011627),
      ),
      body: cartList(),
    );
  }
}

Widget cartList() {
  return Container(
    child: ListView.builder(
        itemCount: shoppingCList.length,
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
                          "images/${shoppingCList[index].image}",
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
                                child: Text(shoppingCList[index].name,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    )),
                              ),
                              Text("\$${shoppingCList[index].price}",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  )),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ButtonTheme(
                                  minWidth: 100,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color(0xFF011627),
                                    child: MaterialButton(
                                      child: Text(
                                        "Confirm Order",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            CupertinoPageRoute(
                                                builder: (context) {
                                          return Order();
                                        }));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}

List<CartClass> shoppingCList = [
  CartClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99),
  CartClass(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99),
  CartClass(
      image: 'Country_Life_Daily_Total_One_Iron_free_60_vegan.PNG',
      name: 'Country Life Daily Total One Iron Free 60 Vegan',
      price: 11.99),
  CartClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99),
];

class CartClass {
  final String image;
  final String name;
  final double price;
  final int orders;

  CartClass({this.name, this.image, this.price, this.orders});
}
