
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/system_bloc/system_bloc.dart';
import 'package:flutterapp2/system_bloc/system_event.dart';
import 'package:flutterapp2/system_bloc/system_state.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/activity.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/exposeddropdown.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/gender.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/goal.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/system.dart';
import 'package:flutterapp2/ui/unicornButton.dart';


import 'package:flutterapp2/data/moor_database.dart';





class MorePage extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}





class _MoreState extends State<MorePage> {




  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    /*BlocProvider.of<SystemBloc>(context).add(GetMetric());*/










    return MaterialApp(
      theme: ThemeData(
          canvasColor: Colors.deepPurple.withAlpha(150),
          primarySwatch: Colors.deepPurple
      ),
      home: Scaffold(
          backgroundColor: Colors.black,

          body: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.deepPurpleAccent.withAlpha(30)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.warning,color: Colors.yellow,size: 40,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(
                      'Unable to Retrieve Profile Data',
                      style: TextStyle(fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    'Please be sure to complete your profile.',
                    /*The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).*/
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ))
      ),
    );


  }








}