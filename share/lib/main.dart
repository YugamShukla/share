import 'dart:async';
import 'package:flutter/material.dart';
import 'package:share/box.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Box());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => {check()});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tapit"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text("Ashley Ribbons\nJoined 24/08/2020"),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Icon(Icons.settings_applications),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Icon(Icons.person),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Text("My groups"),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Icon(Icons.zoom_out_map),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Text("My Rewards"),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Icon(Icons.monetization_on),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Text("Financial Analysis"),
              ],
            ),
            FlatButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Box(),
                  ),
                ),
              },
              child: Text("show box"),
            ),
          ],
        ),
      ),
    );
  }

  void check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status == false) {
      print("hi false");
    } else if (status == true) {
      print("hello truth");
    }
  }
}
