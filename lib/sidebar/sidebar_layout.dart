import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/calculation_bloc/calculation_bloc.dart';
import 'package:flutterapp2/data/moor_database.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/diet_bloc/diet_bloc.dart';
import 'package:flutterapp2/system_bloc/system_bloc.dart';

import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(AppDatabase()),
          ),
          BlocProvider<DefinitionBloc>(
            create: (context) => DefinitionBloc(),
          ),
          BlocProvider<CalculationBloc>(
            create: (context) => CalculationBloc(),
          ),
          BlocProvider<SystemBloc>(
            create: (context) => SystemBloc(),
          ),
          BlocProvider<DietBloc>(
            create: (context) => DietBloc(),
          )
        ],
        child: SideBar(),
      ),
    );
  }
}

