import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uncle_sam_hf/main.dart';
import 'package:uncle_sam_hf/Pages/product_details.dart';

class Products extends StatefulWidget {
  final String name;

  Products({this.name});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Color mainTheme = Color(0xFF011627);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainTheme,
        title: Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Center(child: Text(widget.name)),
        ),
      ),
      body: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return ProductsList(
              name: products[index].name,
              image: products[index].image,
              price: products[index].price,
            );
          }),
    );
  }
}

class ProductsList extends StatelessWidget {
  final String image;
  final String name;
  final double price;

  ProductsList({this.image, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => ProductDetails(
                          name: name,
                          image: image,
                        )));
          },
          child: Container(
            height: 400,
            child: Column(
              children: <Widget>[
                Container(
                  height: 110,
                  child: Image.asset(
                    "images/$image",
                    fit: BoxFit.fill,
                  ),
                ),
                Divider(
                  color: Colors.black12,
                ),
                Container(
                  height: 80,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 105,
                          child: Text(name, style: TextStyle(fontSize: 16.0)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$$price",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<ProductsClass> products = [
  ProductsClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99),
  ProductsClass(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99),
  ProductsClass(
      image: 'Country_Life_Daily_Total_One_Iron_free_60_vegan.PNG',
      name: 'Country Life Daily Total One Iron Free 60 Vegan',
      price: 11.99),
  ProductsClass(
      image: 'Country_Life_Activated_Charcoal.PNG',
      name: 'Country Life - Activated Charcoal',
      price: 199.99),
  ProductsClass(
      image: 'Country_Life_Acid_Rescue_Mint_Flavor_60_chewable.PNG',
      name: 'Country Life - Acid Rescue Mint Flavor - 60 chewable',
      price: 200.99),
  ProductsClass(
      image: 'New_Chapter_Perfect_Energy_Multi_72_Veg_capsules.PNG',
      name: 'New Chapter - Perfect Energy - Multi 72 Veg Capsules',
      price: 280.99),
  ProductsClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99),
  ProductsClass(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99),
  ProductsClass(
      image: 'Country_Life_Activated_Charcoal.PNG',
      name: 'Country Life - Activated Charcoal',
      price: 199.99),
  ProductsClass(
      image: 'Country_Life_Acid_Rescue_Mint_Flavor_60_chewable.PNG',
      name: 'Country Life - Acid Rescue Mint Flavor - 60 chewable',
      price: 200.99),
];

class ProductsClass {
  final String image;
  final String name;
  final double price;

  ProductsClass({this.name, this.image, this.price});
}
