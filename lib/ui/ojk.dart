/*import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/categories.dart';
import './pages/search.dart';

void main() => runApp(new MyApp());*/

/*
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedTab = 0;
  final _pageOptions = [
    HomePage(),
    CatPage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Loopt In'),
        ),
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
*/


/*
Container(
child: Column(children: <Widget>[
Icon(Icons.whatshot, color: Colors.white30,),
Text('Ideal Weight',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
Text('1,717 Cal',style: TextStyle(color: Colors.white,fontSize: 10),)],),
*/
/*margin: EdgeInsets.only(bottom: 50),*//*

decoration: BoxDecoration(
gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
shape: BoxShape.circle,
border: Border.all(
color: Colors.white10,
width: 2,

),
boxShadow: [
BoxShadow(
blurRadius: 6.0,
spreadRadius: 0.0,
color: Colors.transparent,

),
]),
padding: EdgeInsets.all(15),
margin: EdgeInsets.only(left: 2),


),

















Container(
padding: EdgeInsets.all(15),
margin: EdgeInsets.only(left: 2),
decoration: BoxDecoration(
gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
shape: BoxShape.circle,
border: Border.all(
color: Colors.white10,
width: 2,

),
boxShadow: [
BoxShadow(
blurRadius: 6.0,
spreadRadius: 0.0,
color: Colors.transparent,

),
]),
child: Column(children: <Widget>[
Icon(Icons.whatshot, color: Colors.white30,),
Text('BMR',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
Text('1,717 Cal',style: TextStyle(color: Colors.white,fontSize: 10),)],),
),

















Container(
child: Container(
child: Column(children: <Widget>[
Icon(Icons.whatshot, color: Colors.white30,),
Text('Caloric',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
Text('Maintenance',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
Text('1,717 Cal',style: TextStyle(color: Colors.white,fontSize: 10),)],),
width: (width * .22) - 4.2 ,

),
*/
/*margin: EdgeInsets.only(bottom: 50),*//*

decoration: BoxDecoration(
gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
shape: BoxShape.circle,
border: Border.all(
color: Colors.white10,
width: 2,

),
boxShadow: [
BoxShadow(
blurRadius: 6.0,
spreadRadius: 0.0,
color: Colors.transparent,

),
]),
padding: EdgeInsets.all(15),
margin: EdgeInsets.only(right: 1),
),












Container(
padding: EdgeInsets.all(40),
margin: EdgeInsets.only(bottom: 20),
decoration: BoxDecoration(
gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
shape: BoxShape.circle,
border: Border.all(
color: Colors.green,
width: 2,

),
boxShadow: [
BoxShadow(
blurRadius: 6.0,
spreadRadius: 0.0,
color: Colors.transparent,

),
]),
child: Text(
roundDouble(calculateBMI(
profileModel
    .profileAttributes[
profileModel.profileAttributes.length - 1]
.weight,
profileModel
    .profileAttributes[
profileModel.profileAttributes.length - 1]
.height), 2).toString(),

style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
)),*/
