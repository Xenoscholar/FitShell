import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'data/moor_database.dart';
// import 'ui/home_page.dart';

class Bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => AppDatabase(),
      child: Scaffold(
     //   body: BmiPage(),
      ),
    );
  }
}
