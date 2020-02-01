import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter_icons/flutter_icons.dart';


//enum bottomIcons { home, products, favourites }
enum bottomIcons { products, home, inventory, profile }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey();

  var current = 0;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bottomIcons _selectedItem = bottomIcons.home;
  String _data = "HOME";
  Color primaryColor = Colors.white;
  Color active = Color(0xFF20BF55);
  Color inactive = Colors.white;
  ScrollController _scrollAppBarControllerHome = new ScrollController();
  ScrollController _scrollAppBarControllerProducts = new ScrollController();
  ScrollController _scrollAppBarControllerMessages = new ScrollController();
  ScrollController _scrollAppBarControllerFavourites = new ScrollController();

  bool _searchSelected = false;

  int _screen = 1;

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

  Widget imageCarousel() {
    return Container(
      height: 300,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(2, 6),
          blurRadius: 10,
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, top: 0.0, bottom: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Carousel(
            boxFit: BoxFit.fill,
            images: [
              AssetImage("images/leading.jpg"),
              AssetImage("images/image1.PNG"),
              AssetImage("images/image2.PNG"),
              AssetImage("images/image3.jpg")
            ],
            autoplay: true,
            autoplayDuration: Duration(milliseconds: 4000),
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 4.0,
            indicatorBgPadding: 4.0,
            dotBgColor: Colors.transparent,
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
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        color: Colors.redAccent[400],
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

  Widget body() {
    switch (_screen) {
      case 0:
        break;
      case 1:
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
                      style: TextStyle(color: Color(0xFF114B5F), fontSize: 20),
                    ),
                    SizedBox(
                      width: 270,
                    ),
                    InkWell(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz,
                              color: Colors.redAccent[400])),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: categoriesView(),
              ),
              imageCarousel(),
            ],
          ),
        );
        break;
      case 2:
        break;
    }
  }

  Widget navigationBar() {
    return Material(
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12)),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _selectedItem == bottomIcons.products
                    ? Icon(
                        Icons.shopping_cart,
                        size: 30.0,
                        color: inactive,
                      )
                    : Icon(OMIcons.shoppingCart, size: 30.0, color: inactive),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _selectedItem == bottomIcons.home
                    ? Icon(Icons.home, size: 31.0, color: inactive)
                    : Icon(OMIcons.home, size: 31.0, color: inactive),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _selectedItem == bottomIcons.profile
                    ? Icon(Icons.person, size: 30.0, color: inactive)
                    : Icon(OMIcons.person, size: 30.0, color: inactive),
              ),
              title: Text('')),
        ],
        currentIndex: current,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF011627),
        onTap: (index) {
          setState(() {
            current = index;
            switch (current) {
              case 0:
                _selectedItem = bottomIcons.products;
                _data = "Products";
                _screen = 0;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;

                break;
              case 1:
                _selectedItem = bottomIcons.home;
                _data = "Home";
                _screen = 1;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;
                break;
              case 2:
                _selectedItem = bottomIcons.profile;
                _scaffoldkey.currentState.openEndDrawer();
                _searchSelected = true;
                _showAppbar = true;
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
                  "It's Me Bitch",
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
              decoration: BoxDecoration(color: Color(0xFF20BF55)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text("Account"),
                  leading: Icon(Icons.person, color: Color(0xFF20BF55))),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Orders"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Color(0xFF20BF55),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(Icons.shopping_cart, color: Color(0xFF20BF55)),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Log out"),
                leading:
                    Icon(Icons.transit_enterexit, color: Color(0xFF20BF55)),
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
  Categories(image: 'Anti_Inflammatory.PNG', name: 'Anti-Inflamation'),
  Categories(image: 'General_Multivitamins.PNG', name: 'Multivitamins'),
  Categories(image: 'Heart_health.PNG', name: 'Heart Health'),
  Categories(image: 'Calcium.PNG', name: 'Calcium'),
  Categories(image: 'VitaminC.PNG', name: 'Vitamin C')
];

class Categories {
  final String image;
  final String name;

  Categories({this.image, this.name});
}