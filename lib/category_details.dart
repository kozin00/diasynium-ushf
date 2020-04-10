import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uncle_sam_hf/main.dart';
import 'package:uncle_sam_hf/product_details.dart';

class CategoryDetails extends StatefulWidget {
  final String name;

  CategoryDetails({this.name});

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  Color mainTheme = Color(0xFF011627);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainTheme,
        title: Text(widget.name),
      ),
      body: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
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
      padding: const EdgeInsets.all(8.0),
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => ProductDetails(name: name)));
          },
          child: GridTile(
            child: Image.asset(
              "images/$image",
              fit: BoxFit.fill,
            ),
            footer: Container(
              height: 40,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 100,
                      height: 300,
                      child: Text(name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0)),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Expanded(
                      child: Text(
                    "$price",
                    textAlign: TextAlign.right,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
    /* Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          child: Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              ProductDetails(name: name, image: image)));
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(3, 8),
                            blurRadius: 15)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: Image.asset(
                          "images/$image",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "$price",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

    );*/
  }
}

List<Products> products = [
  Products(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99),
  Products(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99),
  Products(
      image: 'Country_Life_Daily_Total_One_Iron_free_60_vegan.PNG',
      name: 'Country Life Daily Total One Iron Free 60 Vegan',
      price: 11.99),
  Products(
      image: 'Country_Life_Activated_Charcoal.PNG',
      name: 'Country Life - Activated Charcoal',
      price: 199.99),
  Products(
      image: 'Country_Life_Acid_Rescue_Mint_Flavor_60_chewable.PNG',
      name: 'Country Life - Acid Rescue Mint Flavor - 60 chewable',
      price: 200.99),
  Products(
      image: 'New_Chapter_Perfect_Energy_Multi_72_Veg_capsules.PNG',
      name: 'New Chapter - Perfect Energy - Multi 72 Veg Capsules',
      price: 280.99),
  Products(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99),
  Products(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99),
  Products(
      image: 'Country_Life_Activated_Charcoal.PNG',
      name: 'Country Life - Activated Charcoal',
      price: 199.99),
  Products(
      image: 'Country_Life_Acid_Rescue_Mint_Flavor_60_chewable.PNG',
      name: 'Country Life - Acid Rescue Mint Flavor - 60 chewable',
      price: 200.99),
];

class Products {
  final String image;
  final String name;
  final double price;

  Products({this.name, this.image, this.price});
}
