import 'package:flutter/material.dart';
import 'package:flutterapp2/nav_bloc/navigation_bloc.dart';
import 'package:flutterapp2/ui/bmi_page.dart';


class BmiNavPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      home: BmiPage(),/*BlocProvider(
        create: (context) => ProfileBloc(AppDatabase()),
        child: BmiPage(),
      ),*/
    );
  }
}

