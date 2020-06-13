

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutterapp2/calculation_bloc/calculation_event.dart';
import 'package:flutterapp2/ui/unicornButton.dart';

import 'dart:async';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/bloc/profile_event.dart';
import 'package:flutterapp2/bloc/profile_state.dart';
import 'package:flutterapp2/calculation_bloc/calculation_bloc.dart';
import 'package:flutterapp2/calculation_bloc/calculation_event.dart';
import 'package:flutterapp2/calculation_bloc/calculation_state.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_event.dart';
import 'package:flutterapp2/definitnion_bloc/definition_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'package:flutterapp2/ui/ojk.dart';
import 'package:flutterapp2/ui/unicornButton.dart';
import 'package:provider/provider.dart';
import 'dart:math';


class InitialPagee {

  InitialPagee_(BuildContext context, ProfileModel profileModel){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Text initialpage = Text('This is the initial page');
  }
}