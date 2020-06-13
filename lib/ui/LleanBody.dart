

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutterapp2/calculation_bloc/calculation_event.dart';
import 'package:flutterapp2/ui/CalculationPages/initialPage.dart';
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

import '../data/moor_database.dart';

class LleanBody {

  LleanBody_(BuildContext context, ProfileModel profileModel){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    SingleChildScrollView leanBody = SingleChildScrollView(

        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black],
                ),
              ),
              child: Container(
                color: Colors.grey[800].withOpacity(.7),
                padding: EdgeInsets.only(
                    left: 10, right: 10, bottom: 20, top: 40),
                width: screenWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Calculations',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),

                    /*buttons for choosing calculations*/
                    Center(
                      child: Container(
                        width: screenWidth,
                        margin: EdgeInsets.only(bottom: 30),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff4a4a4a),
                              ),
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                UnicornOutlineButton(
                                    strokeWidth: 2,
                                    radius: 24,
                                    gradient: LinearGradient(
                                        colors: [Colors.blue, Colors.purple]),
                                    child: Text('BMI',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white)),
                                    onPressed: () =>
                                        BlocProvider.of<CalculationBloc>(
                                            context)
                                            .add(GetBmi())),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: UnicornOutlineButton(
                                      strokeWidth: 2,
                                      radius: 24,
                                      gradient: LinearGradient(
                                          colors: [Colors.blue, Colors.purple]),
                                      child: Text('Body Fat',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white)),
                                      onPressed: () =>
                                          BlocProvider.of<CalculationBloc>(
                                              context)
                                              .add(GetBodyFat())),
                                ),
                                UnicornOutlineButton(
                                    strokeWidth: 2,
                                    radius: 24,
                                    gradient: LinearGradient(
                                        colors: [Colors.blue, Colors.purple]),
                                    child: Text('  Ideal Weight  ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white)),
                                    onPressed: () =>
                                        BlocProvider.of<CalculationBloc>(
                                            context)
                                            .add(GetIdealWeight()))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, top: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3),
                                    child: UnicornOutlineButton(
                                        strokeWidth: 2,
                                        radius: 24,
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.blue,
                                              Colors.purple
                                            ]),
                                        child: Text('BMR',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white)),
                                        onPressed: () =>
                                            BlocProvider.of<CalculationBloc>(
                                                context)
                                                .add(GetBmr())),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: UnicornOutlineButton(
                                        strokeWidth: 2,
                                        radius: 24,
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.blue,
                                              Colors.purple
                                            ]),
                                        child: Text('   Caloric Maintenance   ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white)),
                                        onPressed: () =>
                                            BlocProvider.of<CalculationBloc>(
                                                context)
                                                .add(GetCaloricMaintanence())),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: UnicornOutlineButton(
                                      strokeWidth: 2,
                                      radius: 24,
                                      gradient: LinearGradient(
                                          colors: [Colors.blue, Colors.purple]),
                                      child: Text('   Macronutrients   ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white)),
                                      onPressed: () =>
                                          BlocProvider.of<CalculationBloc>(
                                              context)
                                              .add(GetMacronutrients())),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: UnicornOutlineButton(
                                      strokeWidth: 2,
                                      radius: 24,
                                      gradient: LinearGradient(
                                          colors: [Colors.blue, Colors.purple]),
                                      child: Text('   Lean Body Mass   ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white)),
                                      onPressed: () =>
                                          BlocProvider.of<CalculationBloc>(
                                              context)
                                              .add(GetLeanBodyMass())),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

//                    /*this is where the remaining widgets in the tree will be rebuilt
//                    valueListenerBuilder goes here*/


                    BlocBuilder<CalculationBloc, CalculationState>(
                      builder: (context, state) {
                        if (state is InitialCalculationState) {
                          return InitialPagee().InitialPagee_(context, profileModel);
                        } else if (state is BmiCalculation) {
                          return bmiContainer(profileModel, context);
                        } else if (state is BmrCalculation) {
                          return bmrgoodJob2;
                        } else if (state is IdealWeightCalculation) {
                          return idealmassgoodJob4;
                        } else if (state is CaloricMaintenanceCalculation) {
                          return caloricgoodJob4;
                        } else if (state is MacronutrientsCalculation) {
                          return macronutrientgoodJob4;
                        } else if (state is BodyFatCalculation) {
                          return bodyfatgoodJob3;
                        } else if (state is LeanBodyMassCalculation) {
                          return leanbodymassgoodJob4;
                        } else if (state is LoadingCalculation) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}