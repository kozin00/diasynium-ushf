import './Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int loggedIn=0;

  @override
  void initState() {
    super.initState();
    _isSignedIn();
  }

  void _isSignedIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    bool isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn) {
      setState(() {
        loggedIn = 1;
      });
    }else{
      loggedIn = 2;
    }
  }

  Widget getScreen(int loggedIn){
    switch(loggedIn){
      case 1:
        return Home();
      case 2:
        return Login();
      default:
        return Container(
          color: Colors.white,
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: getScreen(loggedIn),
    );
  }
}
