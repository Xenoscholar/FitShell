import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/ui/bmi_page.dart';


import 'bloc/profile_bloc.dart';

import 'data/moor_database.dart';

// import 'ui/home_page.dart';

class Bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      home: BlocProvider(
        create: (context) => ProfileBloc(AppDatabase()),
        child: BmiPage(),
      ),
    );
  }
}
