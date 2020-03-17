import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:uncle_sam_hf/main.dart';
import 'package:uncle_sam_hf/product_details.dart';

enum bottomIcons { products, home, inventory }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey();

  var current = 0;
  bool isScrollingDown = false;
  bottomIcons _selectedItem = bottomIcons.home;

  //Color active= Color(0xFF20BF55);
  Color primaryColor = Colors.white;
  Color mainTheme = Color(0xFF011627);

  int _screen = 0;

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.black12,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListTile(
            leading: Icon(
              Icons.search,
              color: Color(0xFF114B5F),
              size: 32,
            ),
            title: TextField(
              decoration: InputDecoration(
                  hintText: "Search products", border: InputBorder.none),
            ),
            trailing: Icon(
              Icons.filter_list,
              color: Color(0xFF114B5F),
              size: 32,
            ),
          ),
        ),
      ),
    );
  }

  Widget categoriesView() {
    return Container(
      height: 75,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index) {
            return Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.redAccent[700],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${categoriesList[index].name}",
                            style:
                            TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget showProducts(product) {
    return Padding(
      padding: const EdgeInsets.only(left: 9),
      child: Container(
        height: 260,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(
                            builder: (context) =>
                                ProductDetails(name: product[index].name,
                                    image: product[index].image)
                        ));
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
                            Stack(children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 150,
                                child: Image.asset(
                                  "images/${product[index].image}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SmallButton(Icons.favorite_border),
                              ),
                            ]),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '${product[index].name}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "\$${product[index].price}",
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
              );
            }),
      ),
    );
  }

  Widget banner(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 260, left: 15.0),
      child: Container(
        color: mainTheme,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  Widget body() {
    switch (_screen) {
      case 0:
        return Container(
          child: ListView(
            children: <Widget>[
              searchBar(),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: mainTheme, //Color(0xFF114B5F),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 270,
                    ),
                    InkWell(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz,
                              color: Colors.redAccent[700])),
                    )
                  ],
                ),
              ),
              categoriesView(),
              banner("Popular Products"),
              showProducts(popularProducts),
              SizedBox(
                height: 5.0,
              ),
              banner("New Products"),
              showProducts(newProducts),
              SizedBox(
                height: 5.0,
              ),
              banner("Featured"),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: InkWell(
                  onTap: () {},
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
                          height: 200,
                          child: Image.asset(
                            "images/${categoriesList[0].image}",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            color: mainTheme,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '${categoriesList[0].name}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
        break;
      case 1:
        break;
      case 2:
        return null;
        break;
    }
    return Container();
  }

  Widget navigationBar() {
    return SizedBox(
      height: 72,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: _selectedItem == bottomIcons.home
                    ? Stack(
                  children: <Widget>[
                    Icon(Icons.home, size: 30.0, color: primaryColor),
                    Positioned(
                      child: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.lightGreen[800],
                        size: 16,
                      ),
                      top: 16,
                      left: 16,
                    )
                  ],
                )
                    : Icon(Icons.home, size: 30.0, color: primaryColor),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: _selectedItem == bottomIcons.inventory
                    ? Stack(
                  children: <Widget>[
                    Icon(Icons.view_stream,
                        size: 30.0, color: primaryColor),
                    Positioned(
                      child: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.lightGreen[800],
                        size: 16,
                      ),
                      top: 16,
                      left: 16,
                    )
                  ],
                )
                    : Icon(Icons.view_stream, size: 30.0, color: primaryColor),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: _selectedItem == bottomIcons.products
                    ? Stack(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 28.0,
                      color: primaryColor,
                    ),
                    Positioned(
                      child: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.lightGreen[800],
                        size: 16,
                      ),
                      top: 16,
                      left: 16,
                    )
                  ],
                )
                    : Icon(Icons.shopping_cart,
                    size: 28.0, color: primaryColor),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Icon(Icons.person, size: 30.0, color: primaryColor),
              ),
              title: Text('')),
        ],
        currentIndex: current,
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainTheme,
        onTap: (index) {
          setState(() {
            current = index;
            switch (current) {
              case 0:
                _selectedItem = bottomIcons.home;
                _screen = 0;
                isScrollingDown = false;
                break;
              case 1:
                _selectedItem = bottomIcons.inventory;
                _screen = 1;
                isScrollingDown = false;
                break;
              case 2:
                _selectedItem = bottomIcons.products;
                _screen = 2;
                isScrollingDown = false;
                break;
              case 3:
                _scaffoldkey.currentState.openEndDrawer();
                isScrollingDown = false;
                break;
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: primaryColor,
      key: _scaffoldkey,
      resizeToAvoidBottomPadding: false,
      body: body(),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "Bruce Wayne",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: mainTheme),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Account"),
                  leading: Icon(Icons.person, color: mainTheme)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Favourites"),
                  leading: Icon(Icons.favorite, color: Colors.red)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Orders"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: mainTheme,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(Icons.shopping_cart, color: mainTheme),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Help"),
                leading: Icon(Icons.help, color: Colors.lightBlue),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Log out"),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: navigationBar(),
    );
  }
}

List<Categories> categoriesList = [
  Categories(image: 'Anti_Inflammatory.PNG', name: 'Anti-Inflammation'),
  Categories(image: 'General_Multivitamins.PNG', name: 'Multivitamins'),
  Categories(image: 'Heart_health.PNG', name: 'Heart Health'),
  Categories(image: 'Calcium.PNG', name: 'Calcium'),
  Categories(image: 'VitaminC.PNG', name: 'Vitamin C')
];

List<Products> popularProducts = [
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
      price: 280.99)
];

List<Products> newProducts = [
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
      price: 11.99)
];

class Categories {
  final String image;
  final String name;
  final int orders;

  Categories({this.image, this.name, this.orders});
}

class Products {
  final String image;
  final String name;
  final double price;
  final int orders;

  Products({this.name, this.image, this.price, this.orders});
}

Widget SmallButton(IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(500),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[200], offset: Offset(1, 1), blurRadius: 2)
            ]),
        child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              icon,
              color: Colors.black,
              size: 15,
            )),
      ),
    ),
  );
}
