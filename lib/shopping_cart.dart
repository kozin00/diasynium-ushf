import 'package:flutter/material.dart';

class shoppingCart extends StatefulWidget {
  @override
  _shoppingCartState createState() => _shoppingCartState();
}

class _shoppingCartState extends State<shoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text( "Shopping Cart",
            style: TextStyle(color: Colors.white, fontSize: 18),),
        ),
      backgroundColor: Color(0xFF011627),
      ),
      body: Container(),
    );
  }
}
