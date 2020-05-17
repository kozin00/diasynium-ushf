import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  HashMap favourites = new HashMap(); //Get data from Firebase
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(
            child: Text(
              "Favorites",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        backgroundColor: Color(0xFF011627),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: favouritesList.length,
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
                              "images/${favouritesList[index].image}",
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 150,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(favouritesList[index].name,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      )),
                                ),
                                Text("\$${favouritesList[index].price}",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    )),
                              ]),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          iconSize: 25,
                          icon: (favouritesList[index].selected)
                              ? Icon(
                                  Icons.favorite,
                                  color: Color(0xFF011627),
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Color(0xFF011627),
                                ),
                          onPressed: () {
                            setState(() {
                              favouritesList[index].changestate();
                            });
                            if (favouritesList[index].selected) {
                              var newMap = {
                                favouritesList[index].id:
                                    favouritesList[index].name
                              };

                              favourites.addAll(newMap);
                            } else {
                              favourites.remove(favouritesList[index].id);
                            }
                          },
                        )
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

List<FavouritesClass> favouritesList = [
  FavouritesClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99,
      selected: true),
  FavouritesClass(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99,
      selected: true),
  FavouritesClass(
      image: 'Country_Life_Daily_Total_One_Iron_free_60_vegan.PNG',
      name: 'Country Life Daily Total One Iron Free 60 Vegan',
      price: 11.99,
      selected: false),
  FavouritesClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99,
      selected: true),
  FavouritesClass(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99,
      selected: true),
  FavouritesClass(
      image: 'Country_Life_Daily_Total_One_Iron_free_60_vegan.PNG',
      name: 'Country Life Daily Total One Iron Free 60 Vegan',
      price: 11.99,
      selected: true),
  FavouritesClass(
      image: 'Ionic_Fizz_Magnesium_Plus.PNG',
      name: 'Ionic Fizz Magnesium Plus',
      price: 20.99,
      selected: true),
  FavouritesClass(
      image: 'Allerfree_60_Vegi_Caps.PNG',
      name: 'Allerfree 60 Vegi Caps',
      price: 10.99,
      selected: true),
];

class FavouritesClass {
  final String image;
  final String name;
  final double price;
  String id;
  bool selected;

  FavouritesClass({this.name, this.image, this.price, this.selected});

  void changestate() {
    selected = !selected;
  }
}
