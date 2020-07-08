import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterapp2/profile.dart';
import 'package:flutterapp2/ui/bmi_page.dart';
import 'package:rxdart/rxdart.dart';

import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

  int _selectedTab = 0;

  final _pageOptions = [
    BmiPage(),
    ProfilePage(),
    BmiPage(),
    ProfilePage(),
    BmiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[850],
          selectedItemColor: Colors.white,
          unselectedFontSize: 10,
          selectedFontSize: 10,

          selectedIconTheme: IconThemeData(
            color: Colors.purple,
          ),
          showUnselectedLabels: true,
          showSelectedLabels: true,


          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.grey,),
              title: Text('Home',style: TextStyle(color: Colors.grey)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment,color: Colors.grey),
              title: Text('Progress',style: TextStyle(color: Colors.grey)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.headset,color: Colors.grey),
              title: Text('Calculate',style: TextStyle(color: Colors.grey)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.grey),
              title: Text('Profile',style: TextStyle(color: Colors.grey)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_vert,color: Colors.grey),
              title: Text('More',style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }
}

