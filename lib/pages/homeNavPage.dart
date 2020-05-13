import 'package:flutter/material.dart';
import 'package:flutterapp2/nav_bloc/navigation_bloc.dart';

class HomeNavPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "HomePage",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}

