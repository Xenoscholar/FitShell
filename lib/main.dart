import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/data/moor_database.dart';
import 'package:flutterapp2/splash_screen.dart';
import 'package:flutterapp2/profile.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: ProfilePage()
    );*/

    return Provider(
      builder: (_) => AppDatabase(),
      child: MaterialApp(home: ProfilePage()),
    );
  }
}

















/*void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white10,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage(
                      'pictures/applogo.png'),
                height: 150,
                width: 150,
              ),
              Text(
                  'Fitness',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w300

              )
              ),
            ],
          ),
        ),
      ),
    ),
  );
}*/

