
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/bloc/profile_event.dart';
import 'package:flutterapp2/bloc/profile_state.dart';
import 'package:flutterapp2/calculation_bloc/calculation_bloc.dart';
import 'package:flutterapp2/calculation_bloc/calculation_event.dart';
import 'package:flutterapp2/calculation_bloc/calculation_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'package:flutterapp2/ui/CalculationPages/BodyFatContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/CaloricMaintinenceContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/HeartContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/MacronutrientContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/OneRepMaxContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/bmrContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/extra_calc_dropdown.dart';
import 'package:flutterapp2/ui/CalculationPages/idealBodyMassContainer.dart';
import 'package:flutterapp2/ui/CalculationPages/idealWeight.dart';
import 'package:flutterapp2/ui/CalculationPages/initialPage.dart';
import 'package:flutterapp2/ui/bmiContainter.dart';
import 'package:flutterapp2/ui/unicornButton.dart';
import 'dart:math';

import 'CalculationPages/CreatineContainer.dart';


class BmiPage extends StatelessWidget {


  /*final BuildContext context;
  final ProfileModel profileModel;*/


  /*const BmiPage(this.context,this.profileModel);*/

  double calculateBMI(double weight, double height, bool isMetric) {

    if(isMetric == true) {
      double metersHeight = (height / 100);
      return weight / (metersHeight * metersHeight);


    }else if (isMetric == false) {
      return (703 * (weight / (height * height)));

    }

  }

  String calcIdealWeight(bool isMetric, double height, bool isMale) {
    if(isMetric == true) {

      if(isMale == true) {
        double convertedHeight = cmToInch(height);
        double addedHeight = convertedHeight - 60;
        return poundsToKg( kgToPounds(((addedHeight * 2.3) + 50))).toString() + ' kgs';
      } else if (isMale == false) {
        double convertedHeight = cmToInch(height);
        double addedHeight = convertedHeight - 60;
        return poundsToKg( kgToPounds(((addedHeight * 2.3) + 45.5))).toString() + ' kgs';
      }

    }else if (isMetric == false) {
      if(isMale == true) {
        double addedHeight = height - 60;
        return kgToPounds(((addedHeight * 2.3) + 50.00)).toInt().toString() + ' lbs';
      } else if (isMale == false) {
        double addedHeight = height - 60;
        return kgToPounds(((addedHeight * 2.3) + 45.5)).toInt().toString() + ' lbs';
      }
    }
  }

  int calcBMR(double kgWeight, double cmHeight, int age, bool isMetric, bool isMale) {

    /*For men:
    BMR = 10W + 6.25H - 5A + 5
    For women:
    BMR = 10W + 6.25H - 5A - 161*/

    if(isMetric == true){

      if (isMale == true){
        return ((10*kgWeight) + (6.25*cmHeight) - (5*age) + 5).toInt();
      } else if (isMale == false){
        return ((10*kgWeight) + (6.25*cmHeight) - (5*age) - 161).toInt();
      }


    } else if (isMetric == false) {

      if (isMale == true){
        return ((10*poundsToKg(kgWeight)) + (6.25*inchToCm(cmHeight)) - (5*age) + 5).toInt();
      } else if (isMale == false){
        return ((10*poundsToKg(kgWeight)) + (6.25*inchToCm(cmHeight)) - (5*age) - 161).toInt();
      }

    }
  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  double cmToInch(double cm) {
    return cm / 2.54;
  }

  double inchToCm(double inch) {
    return inch * 2.54;
  }

  double kgToPounds(double kilograms) {
    return (kilograms * 2.205).roundToDouble();
  }

  double poundsToKg(double pounds) {
    return (pounds / 2.205).roundToDouble();
  }





  @override
  Widget build(BuildContext context) {
    String calcPageValue = 'bmi';
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;


    loadInitialPageViaData(context);

    return MaterialApp(
      theme: ThemeData(
          canvasColor: Colors.deepPurple.withAlpha(150),
          primarySwatch: Colors.deepPurple
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black,
        /*appBar: AppBar(
          title: Text('Calculations'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
        ),*/
        body: Container(
          color: Colors.deepPurpleAccent.withAlpha(45),
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
      ),
    );
  }

  Widget buildInitialInput() {
    return Container(
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
        ));
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }



  void loadInitialPageViaData(BuildContext context) {
    print('YASSSSSSSSSSSSSSSSSSSSSSS');
    BlocProvider.of<ProfileBloc>(context).add(GetProfile());
  }










  SingleChildScrollView buildContainerWithData(BuildContext context,
      ProfileModel profileModel, double height, double width) {


    double roundDouble(double value, int places){
      double mod = pow(10.0, places);
      return ((value * mod).round().toDouble() / mod);
    }

    double cmToInch(double cm) {
      return cm / 2.54;
    }

    double inchToCm(double inch) {
      return inch * 2.54;
    }

    double kgToPounds(double kilograms) {
      return (kilograms * 2.205).roundToDouble();
    }

    double poundsToKg(double pounds) {
      return (pounds / 2.205).roundToDouble();
    }

    double calculateBMI(double weight, double height, bool isMetric) {

      if(isMetric == true) {
        double metersHeight = (height / 100);
        return weight / (metersHeight * metersHeight);


      }else if (isMetric == false) {
        return (703 * (weight / (height * height)));

      }

    }

    String calcIdealWeight(bool isMetric, double height, bool isMale) {
      if(isMetric == true) {

        if(isMale == true) {
          double convertedHeight = cmToInch(height);
          double addedHeight = convertedHeight - 60;
          return poundsToKg( kgToPounds(((addedHeight * 2.3) + 50))).toString() + ' kgs';
        } else if (isMale == false) {
          double convertedHeight = cmToInch(height);
          double addedHeight = convertedHeight - 60;
          return poundsToKg( kgToPounds(((addedHeight * 2.3) + 45.5))).toString() + ' kgs';
        }

      }else if (isMetric == false) {
        if(isMale == true) {
          double addedHeight = height - 60;
          return kgToPounds(((addedHeight * 2.3) + 50.00)).toInt().toString() + ' lbs';
        } else if (isMale == false) {
          double addedHeight = height - 60;
          return kgToPounds(((addedHeight * 2.3) + 45.5)).toInt().toString() + ' lbs';
        }
      }
    }

    int calcBMR(double kgWeight, double cmHeight, int age, bool isMetric, bool isMale) {

      /*For men:
    BMR = 10W + 6.25H - 5A + 5
    For women:
    BMR = 10W + 6.25H - 5A - 161*/

      if(isMetric == true){

        if (isMale == true){
          return ((10*kgWeight) + (6.25*cmHeight) - (5*age) + 5).toInt();
        } else if (isMale == false){
          return ((10*kgWeight) + (6.25*cmHeight) - (5*age) - 161).toInt();
        }


      } else if (isMetric == false) {

        if (isMale == true){
          return ((10*poundsToKg(kgWeight)) + (6.25*inchToCm(cmHeight)) - (5*age) + 5).toInt();
        } else if (isMale == false){
          return ((10*poundsToKg(kgWeight)) + (6.25*inchToCm(cmHeight)) - (5*age) - 161).toInt();
        }

      }
    }

    int calcCaloricMaintinence(int BMR, int activityLevel) {

      if(activityLevel == 1) {
        return (BMR * 1.2).toInt();

      } else if (activityLevel == 2) {
        return (BMR * 1.375).toInt();
      } else if (activityLevel == 3) {
        return (BMR * 1.465).toInt();
      } else if (activityLevel == 4) {
        return (BMR * 1.55).toInt();
      } else if (activityLevel == 5) {
        return (BMR * 1.725).toInt();
      } else if (activityLevel == 6) {
        return (BMR * 1.9).toInt();
      }

    }






    double bmiScore = (roundDouble(calculateBMI(
        profileModel
            .profileAttributes[
        profileModel.profileAttributes.length - 1]
            .weight,
        profileModel
            .profileAttributes[
        profileModel.profileAttributes.length - 1]
            .height,
        profileModel
            .profileAttributes[
        profileModel.profileAttributes.length - 1]
            .isMetric), 2));

    String idealWeightScore = calcIdealWeight(
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale
    ).toString();

    int bmrScore = calcBMR(profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].age,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale
    );


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
            color: /*Colors.grey[800].withOpacity(.7)*/Colors.deepPurpleAccent.withAlpha(45),
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 40),
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 10),
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
                            color: Colors.deepPurpleAccent.withAlpha(30),
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[

                                Container(
                                  child: UnicornOutlineButton(
                                      strokeWidth: 2,
                                      radius: 24,
                                      gradient: LinearGradient(
                                          colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
                                      child: Text('BMI',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white)),
                                      onPressed: () =>
                                          BlocProvider.of<CalculationBloc>(context)
                                              .add(GetBmi())),
                                  width: width * .35,
                                ),





                                  Container(
                                    width: width * .35,
                                    child: UnicornOutlineButton(
                                        strokeWidth: 2,
                                        radius: 24,
                                        gradient: LinearGradient(
                                            colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
                                        child: Text('Body Fat',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white)),
                                        onPressed: () =>
                                            BlocProvider.of<CalculationBloc>(context)
                                                .add(GetBodyFat())),
                                  ),



                            ],
                          ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[

                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                              Container(
                                width: (width * .37),
                                child: UnicornOutlineButton(
                                    strokeWidth: 2,
                                    radius: 24,
                                    gradient: LinearGradient(
                                        colors: [Colors.purpleAccent, Colors.deepPurpleAccent],),
                                    child: Text('Macronutrients',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white)),
                                    onPressed: () =>
                                        BlocProvider.of<CalculationBloc>(context)
                                            .add(GetMacronutrients())),
                              ),

                            Container(
                                width: (width * .35),
                                child: UnicornOutlineButton(
                                    strokeWidth: 2,
                                    radius: 24,
                                    gradient: LinearGradient(
                                        colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
                                    child: Text('Lean Mass',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white)),
                                    onPressed: () =>
                                        BlocProvider.of<CalculationBloc>(context)
                                            .add(GetLeanBodyMass())),
                              ),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Text('More:',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300),),
                        ),
                        Container(
                                padding: EdgeInsets.only(left: 7,right: 7),
                                margin: EdgeInsets.only(left: 10,right: 0),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent.withAlpha(40),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: (width * .55) - 10,
                                child:ExtraCalcDropDown(),
                            ),
                      ],
                    ),
                  ),
                ),

//                    /*this is where the remaining widgets in the tree will be rebuilt
//                    valueListenerBuilder goes here*/

              Column(
      children: <Widget>[
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.withAlpha(30),
                  ),
                ]
            ),
            child: Column(
              children: <Widget>[
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurpleAccent.withAlpha(30),
                          ),
                        ]
                    ),

                        padding: EdgeInsets.all(1),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4,bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                child: Column(children: <Widget>[
                                  Icon(Icons.assignment_turned_in, color: Colors.grey,),
                                  Text('Ideal Weight',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
                                  Text(idealWeightScore,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12))]),
/*margin: EdgeInsets.only(bottom: 50),*/
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white10,
                                      width: 2,

                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        spreadRadius: 0.0,
                                        color: Colors.transparent,

                                      ),
                                    ]),
                                padding: EdgeInsets.all(12),


                              ),

















                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(left: width * .05,right: width * .05),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white10,
                                          width: 2,

                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 6.0,
                                            spreadRadius: 0.0,
                                            color: Colors.transparent,

                                          ),
                                        ]),
                                    child: Column(children: <Widget>[
                                      Icon(Icons.whatshot, color: Colors.grey,),
                                      Text('BMR',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
                                      Text(calcBMR(profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight,
                                          profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
                                          profileModel.profileAttributes[profileModel.profileAttributes.length -1].age,
                                          profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric,
                                          profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale
                                      ).toString() + ' Cal',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w300),)],),
                                  ),


                                ],
                              ),

















                              Container(
                                child: Container(
                                  child: Column(children: <Widget>[
                                    Icon(Icons.directions_run, color: Colors.grey,),
                                    Text('Caloric',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
                                    Text('Maintenance',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
                                    Text(calcCaloricMaintinence(bmrScore, profileModel.profileAttributes[profileModel.profileAttributes.length -1].activity,).toString() + ' Cal',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w300),)],),

                                ),
/*margin: EdgeInsets.only(bottom: 50),*/
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white10,
                                      width: 2,

                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        spreadRadius: 0.0,
                                        color: Colors.transparent,

                                      ),
                                    ]),
                                padding: EdgeInsets.all(7),
                              ),

                            ],
                          ),
                        ),
                      ),
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
                    } else if (state is TargetHeartRateCalculation) {
                      /* return macronutrientgoodJob4;*/
                      return HeartContainer(context, profileModel);
                    } else if (state is CreatineIntakeCalculation) {
                      /* return macronutrientgoodJob4;*/
                      return CreatineContainer(context, profileModel);
                    } else if (state is OneRepMaxCalculation) {
                      /* return macronutrientgoodJob4;*/
                      return OneRepMaxContainer(context, profileModel);
                    }
                  },
                ),

              ],
            ),
          ),
        ),
        /*Container(
          margin: EdgeInsets.only(top: 10),

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent.withAlpha(30),
                ),
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('data')
            ],
          ),
        ),*/
      ],
    )




              ],
            ),
          ),
        ),
      ],
    ));
  }

  final Widget initialbitch = const Text('Initial Bitch!');

  final Widget bmrgoodJob1 = const Text('bmi job!');

  final Widget bmrgoodJob2 = const Text('bmr job!');
  final Widget bodyfatgoodJob3 = const Text('body fat job!');
  final Widget leanbodymassgoodJob4 = const Text('lean body mass job!');
  final Widget caloricgoodJob4 = const Text('caloric mass job!');
  final Widget idealmassgoodJob4 = const Text('ideal mass job!');
  final Widget macronutrientgoodJob4 = const Text('macro mass job!');


  /*BlocBuilder<CalculationBloc, CalculationState>(
  builder: (context, state) {
  if (state is InitialCalculationState) {
  return InitialPagee(context, profileModel);
  } else if (state is BmiCalculation) {
  *//*return bmiContainer(profileModel, context);*//*
  return BmiContainer(context, profileModel);
  } else if (state is BmrCalculation) {
  *//*return bmrgoodJob2;*//*
  return BmrContainer(context, profileModel);
  } else if (state is IdealWeightCalculation) {
  *//*return idealmassgoodJob4;*//*
  return IdealWeightContainer(context, profileModel);
  } else if (state is CaloricMaintenanceCalculation) {
  *//* return caloricgoodJob4;*//*
  return CaloricMaintanenceContainer(context, profileModel);
  } else if (state is MacronutrientsCalculation) {
  *//* return macronutrientgoodJob4;*//*
  return MacronutrientsContainer(context, profileModel);
  } else if (state is BodyFatCalculation) {
  *//*  return bodyfatgoodJob3;*//*
  return BodyFatContainer(context, profileModel);
  } else if (state is LeanBodyMassCalculation) {
  *//*return leanbodymassgoodJob4;*//*
  return IdealBodyMassContainer(context, profileModel);
  } else if (state is LoadingCalculation) {
  return Center(
  child: CircularProgressIndicator(),
  );
  }
  },
  ),*/



}
