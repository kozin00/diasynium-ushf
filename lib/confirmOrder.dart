import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Color mainTheme=Color(0xFF011627);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF011627),
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(child: Text("Confirm Order")),
        ),
      ),
      body: Column(
        children: <Widget>[
          Image.asset("images/Ionic_Fizz_Magnesium_Plus.PNG"),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Ionic Fizz Magnesium Plus",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "\$19.99",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(
              color: Colors.black38,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 100,
                  child: Text(
                    "Option: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  " M",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    "Quantity: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  "20",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0, top: 30.0),
            child: Row(
              children: <Widget>[
                Material(
                  color: mainTheme,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12)),
                    child: Container(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: IconButton(
                          onPressed: (){
                            //Don't navigate if payment method isn't selected
                          },
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Material(
                    color: mainTheme,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12)),
                    child: Container(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: (){},
              child: Text(
                "Select Payment method",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: mainTheme
                  ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
