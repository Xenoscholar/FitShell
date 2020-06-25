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
import 'package:flutterapp2/ui/CalculationPages/BodyFatContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/CaloricMaintinenceContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/MacronutrientContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/bmrContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/idealBodyMassContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/idealWeight.dart';
import 'package:flutterapp2/ui/CalculationPages/initialPage.dart';
import 'package:flutterapp2/ui/bmiContainter.dart';
import 'package:flutterapp2/ui/ojk.dart';
import 'package:flutterapp2/ui/unicornButton.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../data/moor_database.dart';

class BmiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String calcPageValue = 'bmi';
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    loadInitialPageViaData(context);

    return Scaffold(
      /*appBar: AppBar(
        title: Text('Calculations'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),*/
      body: Container(
        color: Colors.grey[850],
        /*padding: EdgeInsets.symmetric(vertical: 16),*/
        alignment: Alignment.center,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial) {
              return buildInitialInput();
            } else if (state is ProfileLoading) {
              return buildLoading();
            } else if (state is ProfileLoaded) {
              return buildContainerWithData(
                  context, state.profileModel, screenHeight, screenWidth);
            } else if (state is ProfileError) {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
        child: Text('There was an error. Be sure to complete your profile.'));
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  void loadInitialPageViaData(BuildContext context) {
    print('YASSSSSSSSSSSSSSSSSSSSSSS');
    BlocProvider.of<ProfileBloc>(context).add(GetProfile());
  }

  double calculateBMI(int weight, int height) {
    return (703 * (weight / (height * height))).toDouble();
  }

  /*Column bmiContainer(ProfileModel profileModel, BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff4a4a4a),
                  ),
                ]),
            child: Column(
              children: <Widget>[
                BlocBuilder<DefinitionBloc, DefinitionState>(
                    bloc: BlocProvider.of<DefinitionBloc>(context),
                    builder: (context, state) {
                      if (state is TrueDefinition) {
                        return Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ]),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Text(
                                    'What is BMR',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                Text(
                                  'The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200),
                                ),
                                IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () =>
                                        BlocProvider.of<DefinitionBloc>(context)
                                            .add(RemoveDefinition())),
                              ],
                            ));
                      } else if (state is FalseDefinition) {
                        return Center(
                            child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'What is BMI?',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.5)),
                            ),
                            IconButton(
                              onPressed: () =>
                                  BlocProvider.of<DefinitionBloc>(context)
                                      .add(GetDefinition()),
                              icon: Icon(Icons.info),
                            )
                          ],
                        ));
                      } else if (state is LoadingDefinition) {
                        return Container(
                          color: Colors.yellow,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                          child: Text(
                              'foxy grandpa',style: TextStyle(color: Colors.pinkAccent),)
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(40),
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.transparent,
                                    Colors.transparent
                                  ]),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6.0,
                                      spreadRadius: 0.0,
                                      color: Colors.transparent,
                                    ),
                                  ]),
                              child: Text(
                                roundDouble(
                                        calculateBMI(
                                            profileModel
                                                .profileAttributes[profileModel
                                                        .profileAttributes
                                                        .length -
                                                    1]
                                                .weight,
                                            profileModel
                                                .profileAttributes[profileModel
                                                        .profileAttributes
                                                        .length -
                                                    1]
                                                .height),
                                        2)
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              )),
                          Padding(
                            padding: EdgeInsets.only(bottom: 35),
                            child: Text(
                              'Moderate Condition',
                              style: TextStyle(
                                color: Colors.green.withOpacity(.5),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(.5),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              color: Colors.blue,
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Text(
                              'Underweight',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '<18.5',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xFF000000).withAlpha(60),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              color: Colors.green,
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Text(
                              'Normal',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '18.5 - 24.9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              color: Colors.orange,
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Text(
                              'Overweight',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '25 - 29.9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              color: Colors.deepOrange,
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Text(
                              'Obese',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '<30 - 34.9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            Container(
                              color: Colors.red,
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(right: 10),
                            ),
                            Text(
                              'Very Obese',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '35 +',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff4a4a4a),
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[Text('data')],
          ),
        ),
      ],
    );
  }*/

  SingleChildScrollView buildContainerWithData(BuildContext context,
      ProfileModel profileModel, double height, double width) {
    return SingleChildScrollView(
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
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 40),
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Calculations',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),

                /*buttons for choosing calculations*/
                Center(
                  child: Container(
                    width: width,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff4a4a4a),
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                width: (width * .5) - 40,
                                  child: UnicornOutlineButton(
                                      strokeWidth: 2,
                                      radius: 24,
                                      gradient: LinearGradient(
                                          colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
                                      child: Text('          BMI          ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white)),
                                      onPressed: () =>
                                          BlocProvider.of<CalculationBloc>(context)
                                              .add(GetBmi())),
                                ),
                              ),


                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    width: (width * .5) - 40,
                                    child: UnicornOutlineButton(
                                        strokeWidth: 2,
                                        radius: 24,
                                        gradient: LinearGradient(
                                            colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
                                        child: Text('       Body Fat       ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white)),
                                        onPressed: () =>
                                            BlocProvider.of<CalculationBloc>(context)
                                                .add(GetBodyFat())),
                                  ),
                                ),

                              /*UnicornOutlineButton(
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
                                      BlocProvider.of<CalculationBloc>(context)
                                          .add(GetIdealWeight()))*/
                            ],
                          ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              /*Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: UnicornOutlineButton(
                                    strokeWidth: 2,
                                    radius: 24,
                                    gradient: LinearGradient(
                                        colors: [Colors.blue, Colors.purple]),
                                    child: Text('BMR',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white)),
                                    onPressed: () =>
                                        BlocProvider.of<CalculationBloc>(
                                                context)
                                            .add(GetBmr())),
                              )*//*,
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: UnicornOutlineButton(
                                    strokeWidth: 2,
                                    radius: 24,
                                    gradient: LinearGradient(
                                        colors: [Colors.blue, Colors.purple]),
                                    child: Text('   Caloric Maintenance   ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white)),
                                    onPressed: () =>
                                        BlocProvider.of<CalculationBloc>(
                                                context)
                                            .add(GetCaloricMaintanence())),
                              ),*/
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                width: (width * .5) - 30,
                                child: UnicornOutlineButton(
                                    strokeWidth: 2,
                                    radius: 24,
                                    gradient: LinearGradient(
                                        colors: [Colors.purpleAccent, Colors.deepPurpleAccent],),
                                    child: Text('   Macronutrients   ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white)),
                                    onPressed: () =>
                                        BlocProvider.of<CalculationBloc>(context)
                                            .add(GetMacronutrients())),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: (width * .5) - 40,
                                child: UnicornOutlineButton(
                                    strokeWidth: 2,
                                    radius: 24,
                                    gradient: LinearGradient(
                                        colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
                                    child: Text('Lean Body Mass',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white)),
                                    onPressed: () =>
                                        BlocProvider.of<CalculationBloc>(context)
                                            .add(GetLeanBodyMass())),
                              ),
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
                      return InitialPagee(context, profileModel);
                    } else if (state is BmiCalculation) {
                      /*return bmiContainer(profileModel, context);*/
                      return BmiContainer(context, profileModel);
                    } else if (state is BmrCalculation) {
                      /*return bmrgoodJob2;*/
                      return BmrContainer(context, profileModel);
                    } else if (state is IdealWeightCalculation) {
                      /*return idealmassgoodJob4;*/
                      return IdealWeightContainer(context, profileModel);
                    } else if (state is CaloricMaintenanceCalculation) {
                      /* return caloricgoodJob4;*/
                      return CaloricMaintanenceContainer(context, profileModel);
                    } else if (state is MacronutrientsCalculation) {
                      /* return macronutrientgoodJob4;*/
                      return MacronutrientsContainer(context, profileModel);
                    } else if (state is BodyFatCalculation) {
                      /*  return bodyfatgoodJob3;*/
                      return BodyFatContainer(context, profileModel);
                    } else if (state is LeanBodyMassCalculation) {
                      /*return leanbodymassgoodJob4;*/
                      return IdealBodyMassContainer(context, profileModel);
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
    ));
  }

  final Widget initialbitch = const Text('Initial Bitch!');

  final Widget bmrgoodJob1 = Text('bmi job!');

  final Widget bmrgoodJob2 = const Text('bmr job!');
  final Widget bodyfatgoodJob3 = const Text('body fat job!');
  final Widget leanbodymassgoodJob4 = const Text('lean body mass job!');
  final Widget caloricgoodJob4 = const Text('caloric mass job!');
  final Widget idealmassgoodJob4 = const Text('ideal mass job!');
  final Widget macronutrientgoodJob4 = const Text('macro mass job!');
}
