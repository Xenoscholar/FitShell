import 'package:flutter/material.dart';
import 'package:flutterapp2/ui/bmi_page.dart';




// import 'ui/home_page.dart';

class Bmi extends StatelessWidget {
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
