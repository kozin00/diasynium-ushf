import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';
import 'package:uncle_sam_hf/db/database_operations.dart';
import 'package:uncle_sam_hf/products.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:uncle_sam_hf/shopping_cart.dart';

class ProductDetails extends StatefulWidget {
  final String name;
  final String image;
  String prodId;
  String userId;

  ProductDetails({this.name, this.image});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController _scrollController = new ScrollController();
  String _home = "";
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool _favouriteIcon = false;
  Color mainTheme = Color(0xFF011627);
  int count = 0;
  String groupValue;
  Map<String, bool> optionsValues = {};
  HashMap favourites=new HashMap();

  DatabaseOperations dbOperation = new DatabaseOperations();

  @override
  void initState() {
    super.initState();
    myScroll();
    groupValue = optionsList[0] ?? '';
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});

    super.dispose();
  }

  bool get _isAppBarNotExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  void myScroll() async {
    _scrollController.addListener(() {
      _isAppBarNotExpanded
          ? setState(() {
              _home = "Uncle Sam's Health Foods";
            })
          : setState(() {
              _home = "";
            });
    });

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = false;
          });
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            _showAppbar = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    iconTheme: IconThemeData(
                      color: (_isAppBarNotExpanded) ? Colors.white : mainTheme,
                    ),
                    title: Center(
                        child: Text(
                      _home,
                      style: TextStyle(color: Colors.white),
                    )),
                    backgroundColor: mainTheme,
                    actions: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              CupertinoPageRoute(builder: (context) {
                            return ShoppingCart();
                          }));
                        },
                        icon: Icon(Icons.shopping_cart,
                            color: (_isAppBarNotExpanded)
                                ? Colors.white
                                : mainTheme),
                      )
                    ],
                    expandedHeight: 330.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        background: Container(
                            height: 300,
                            child: Carousel(
                              boxFit: BoxFit.cover,
                              images: [
                                AssetImage('images/${widget.image}'),
                                AssetImage('images/${widget.image}'),
                                AssetImage('images/${widget.image}'),
                              ],
                              autoplay: true,
                              autoplayDuration: Duration(milliseconds: 4000),
                              animationCurve: Curves.fastOutSlowIn,
                              animationDuration: Duration(milliseconds: 1000),
                              dotSize: 6.0,
                              indicatorBgPadding: 4.0,
                              dotBgColor: Colors.transparent,
                            ))),
                  ),
                ),
              ),
            ];
          },
          body: SizedBox(
            child: _showList(),
          )),
    );
  }

  _buildExpandableContentO(List<String> options) {
    List<Widget> columnContent = [];

    for (String content in options) {
      columnContent.add(ListTile(
        title: Text(content),
        trailing: Radio(
          value: content,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
      ));
    }
    return columnContent;
  }

  _showList() {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 210,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 13.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              widget.name,
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
                    SizedBox(
                      width: 104,
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: _favouriteIcon
                                  ? Icon(Icons.favorite,
                                      color: mainTheme, size: 30)
                                  : Icon(
                                      Icons.favorite_border,
                                      color: mainTheme,
                                      size: 30,
                                    ),
                              onPressed: () {
                                setState(() {
                                  _favouriteIcon = !_favouriteIcon;
                                });
                                if (_favouriteIcon) {
                                  var newMap = {widget.prodId: widget.name};

                                  favourites.addAll(newMap);
                                } else {
                                  favourites.remove(widget.prodId);
                                }
                              },
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: mainTheme,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,
                                color: mainTheme,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return Products(
                                    name: "Calcium",
                                  );
                                }));
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                child: Divider(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 20, 13, 30),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod "
              "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis "
              " nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
              "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore "
              "eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, "
              "sunt in culpa qui officia deserunt mollit anim id est laborum",
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
          ),
        ),
        (optionsList.length != 0)
            ? Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Options",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )),
                  Divider(color: Colors.black12),
                  Column(
                    children: _buildExpandableContentO(optionsList),
                  ),
                  Divider(color: Colors.black12),
                ],
              )
            : Container(),
        Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(105.0, 50.0, 0.0, 2.0),
              child: Row(
                children: <Widget>[
                  Material(
                    color: Colors.white,
                    elevation: 1.0,
                    shadowColor: Colors.grey,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(color: Colors.black12)),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          (count == 0) ? count = 0 : count--;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Material(
                      color: Colors.white,
                      elevation: 1.0,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.black12)),
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Center(
                          child: Text(
                            '$count',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    elevation: 1.0,
                    shadowColor: Colors.grey,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(color: Colors.black12)),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          (count == 10) ? count = count : count++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 300,
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        color: mainTheme,
                        child: MaterialButton(
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onPressed: () {
                            //dbOperation.updateFavourites(favourites, widget.userId);
                            //update shoppingCartList
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

abstract class Inventory {}

class Details implements Inventory {}

class Description implements Inventory {}

class AddToCart implements Inventory {}

class Options implements Inventory {
  final String title;
  final List<String> children;

  Options(
    this.title,
    this.children,
  );
}

List<Details> details = [Details()];
List<AddToCart> addToCart = [AddToCart()];
List<Description> description = [Description()];
List<String> optionsList = ["S", "M", "L"];
