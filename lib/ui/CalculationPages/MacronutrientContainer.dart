


import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_event.dart';
import 'package:flutterapp2/definitnion_bloc/definition_state.dart';
import 'package:flutterapp2/diet_bloc/diet_bloc.dart';
import 'package:flutterapp2/diet_bloc/diet_event.dart';
import 'package:flutterapp2/diet_bloc/diet_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'dart:math';




class MacronutrientsContainer extends StatelessWidget {
  final BuildContext context;
  final ProfileModel profileModel;


  const MacronutrientsContainer(this.context,this.profileModel);

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

  double calcLeanBodyMass (double height,double weight, bool gender, isMetric) {
    if(isMetric == true) {
      if(gender == true) {
        return roundDouble((0.407 * weight) + (0.267 * height) - 19.2,2);
      } else if (gender == false) {
        return roundDouble ((0.252 * weight) + (0.473 * height) - 48.3, 2);
      }

    } else if (isMetric == false) {
      double newWeight = poundsToKg(weight);
      double newHeight = inchToCm(height);

      if(gender == true) {
        return kgToPounds(roundDouble((0.407 * newWeight) + (0.267 * newHeight) - 19.2,2));
      } else if (gender == false) {
        return kgToPounds( roundDouble ((0.252 * newWeight) + (0.473 * newHeight) - 48.3, 2));
      }

    }
  }

  int calcLeanBodyPercentage(double weighttt, double leanBodyMass) {
    return ((leanBodyMass / weighttt) * 100).round();
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


  /*Ideal Weight
  B. J. Devine Formula (1974)
  Male:	50.0 kg + 2.3 kg per inch over 5 feet
  Female:	45.5 kg + 2.3 kg per inch over 5 feet*/



  Color calcCircleColor(double calculation) {

    if ((calculation > 0) & (calculation < 18.5)) {
      return Colors.blue;
    } else if ((calculation >= 18.5) & (calculation < 25)) {
      return Colors.green;
    } else if ((calculation >= 25) & (calculation < 30)) {
      return Colors.orange;
    } else if ((calculation >= 30) & (calculation < 35)) {
      return Colors.deepOrange;
    } else if (calculation >= 35) {
      return Colors.red;
    }

  }

  String calcTextColor(double calculation) {

    if ((calculation > 0) & (calculation < 18.5)) {
      return 'Underweight';
    } else if ((calculation >= 18.5) & (calculation < 25)) {
      return 'Normal';
    } else if ((calculation >= 25) & (calculation < 30)) {
      return 'Overweight';
    } else if ((calculation >= 30) & (calculation < 35)) {
      return 'Obese';
    } else if (calculation >= 35) {
      return 'Very Obese';
    }

  }

  /*double calcIdealWeight(int age, bool gender, double height, bool system) {
    switch (gender) {
      case true:
        {
          if (system == true) {
            return Color(0xFF000000).withAlpha(60);

            //convert kg to lbs for final double
          } else if (system == false) {
            return Colors.transparent;
          }
        }
        break;

      case false:
        {
          if (system == true) {
            return Color(0xFF000000).withAlpha(60);
          } else if (system == false) {
            return Colors.transparent;
          }
        }
        break;
    }
  }*/

  Color calcHighlightleColor(double calculation, int tier) {

    switch(tier) {
      case 1: {
        if ((calculation > 0) & (calculation < 18.5)) {
          return Color(0xFF000000).withAlpha(60);
        } else {
          return Colors.transparent;
        }
      }
      break;

      case 2: {
        if ((calculation >= 18.5) & (calculation < 25)) {
          return Color(0xFF000000).withAlpha(60);
        } else {
          return Colors.transparent;
        }
      }
      break;

      case 3: {
        if ((calculation >= 25) & (calculation < 30)) {
          return Color(0xFF000000).withAlpha(60);
        } else {
          return Colors.transparent;
        }
      }
      break;

      case 4: {
        if ((calculation >= 30) & (calculation < 35)) {
          return Color(0xFF000000).withAlpha(60);
        } else {
          return Colors.transparent;
        }
      }
      break;

      case 5: {
        if (calculation >= 35) {
          return Color(0xFF000000).withAlpha(60);
        } else {
          return Colors.transparent;
        }
      }
      break;
    }

  }


  @override
  Column build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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

    double leanBodyMassScore = (calcLeanBodyMass(profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric));

    String leanBodyMassPercentage = (calcLeanBodyPercentage(profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight, leanBodyMassScore)).toString();




    int calcCaloricMaintinence(int BMR, int activityLevel,int goal ) {

      double goalLevel;

      switch(goal) {
        case 1: {  goalLevel = 1; }
        break;

        case 2: {  goalLevel = .88; }
        break;

        case 3: {  goalLevel = .76; }
        break;

        case 4: {  goalLevel = .52; }
        break;

        case 5: {  goalLevel = 1.12; }
        break;

        case 6: {  goalLevel = 1.24; }
        break;

        case 7: {  goalLevel = 1.48; }
        break;
      }

      if(activityLevel == 1) {
        return ((BMR * 1.2)*goalLevel).toInt();

      } else if (activityLevel == 2) {
        return ((BMR * 1.375)*goalLevel).toInt();
      } else if (activityLevel == 3) {
        return ((BMR * 1.465)*goalLevel).toInt();
      } else if (activityLevel == 4) {
        return ((BMR * 1.55)*goalLevel).toInt();
      } else if (activityLevel == 5) {
        return ((BMR * 1.725)*goalLevel).toInt();
      } else if (activityLevel == 6) {
        return ((BMR * 1.9)*goalLevel).toInt();
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

    String weightGoal(int goal) {
      switch(goal) {
        case 1: {
          return 'Maintain Weight';
        }
        break;

        case 2: {
          return 'Mild Weight Loss (.5lb / .25kg per week)';
        }
        break;

        case 3: {
          return 'Medium Weight Loss (1lb / .5kg per week)';
        }
        break;

        case 4: {
          return 'Extreme Weight Loss (2lb / 1kg per week)';
        }
        break;

        case 5: {
          return 'Mild Weight Gain (.5lb / .25kg per week)';
        }
        break;

        case 6: {
          return 'Medium Weight Gain (1 lb / .5kg per week)';
        }
        break;

        case 7: {
          return 'Extreme Weight Gain (2 lb / 1kg per week)';
        }
        break;

      }
    }

    String weightActivity(int activity) {
      switch(activity) {
        case 1: {
          return 'Sedentary: Little or no exercise';
        }
        break;

        case 2: {
          return 'Light: Exercise 1-3 times/week';
        }
        break;

        case 3: {
          return 'moderate: Exercise 4-5 times/week';
        }
        break;

        case 4: {
          return 'Active: Daily Exercise or intense exercise 3-4 times/week';
        }
        break;

        case 5: {
          return 'Very Active: Intense exercise 6-7 times/week';
        }
        break;

        case 6: {
          return 'Extra Active: Intense Exercise daily';
        }
        break;


      }
    }

    int Macrograms(int dailyCal, double percentage, double MacroFactor ) {
      int cal = (dailyCal * percentage).toInt();

      return (cal / MacroFactor).toInt();
    }

    int bmrScore = calcBMR(profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].age,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale
    );

    int dailyCalorieScore = calcCaloricMaintinence(bmrScore, profileModel.profileAttributes[profileModel.profileAttributes.length -1].activity,profileModel.profileAttributes[profileModel.profileAttributes.length -1].goal);



    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                      ),
                    ]
                ),
                child: Column(
                  children: <Widget>[
                    BlocBuilder<DefinitionBloc, DefinitionState>(
                        bloc: BlocProvider.of<DefinitionBloc>(context),
                        builder: (context, state) {

                          if(state is TrueDefinition) {
                            return Container(
                                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                                      child: Text(
                                        'What are Macronutrients?',
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      'Macronutrients are nutrients needed in larger amounts in order to function properly. There are three types of macronutrients: carbohydrates, proteins, and fats.',
                                      /*The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).*/
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    IconButton(icon: Icon(Icons.cancel), onPressed: () => BlocProvider.of<DefinitionBloc>(context).add(RemoveDefinition()), color: Colors.white.withAlpha(45),),
                                  ],
                                ));
                          } else if (state is FalseDefinition) {

                            return Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('What are Macronutrients?',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.5)
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => BlocProvider.of<DefinitionBloc>(context).add(GetDefinition()),
                                      icon: Icon(Icons.info),
                                      color: Colors.white.withAlpha(45),
                                    )
                                  ],
                                )
                            );
                          } else if (state is LoadingDefinition) {
                            return Container(
                              color: Colors.yellow,
                              child: Center(
                                child: CircularProgressIndicator(
                                ),
                              ),
                            );
                          }
                        }
                    ),



                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            /*RaisedButton(onPressed: null,disabledColor: Colors.deepOrange,child: Text('Balanced',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),),*/
    BlocBuilder<DietBloc, DietState>(
    bloc: BlocProvider.of<DietBloc>(context),
    builder: (context, state) {
    if(state is  LowFatDietState) {
                           return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetLowFatDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(200),color: Colors.deepPurpleAccent.withAlpha(50),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('Low Fat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);
    } else {
      return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetLowFatDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(200),color: Colors.deepPurpleAccent.withAlpha(200),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('Low Fat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);

    };
    }
    ),

                            BlocBuilder<DietBloc, DietState>(
                                bloc: BlocProvider.of<DietBloc>(context),
                                builder: (context, state) {
                                  if(state is LowCarbDietState) {
                                    return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetLowCarbDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(50),color: Colors.deepPurpleAccent.withAlpha(50),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('Low Carb',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);
                                } else {
                                    return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetLowCarbDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(200),color: Colors.deepPurpleAccent.withAlpha(200),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('Low Carb',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);
                                  };
                                }
                            ),


                            BlocBuilder<DietBloc, DietState>(
                                bloc: BlocProvider.of<DietBloc>(context),
                                builder: (context, state) {
                                  if(state is HighProteinDietState) {
                                   return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetHighProteinDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(50),color: Colors.deepPurpleAccent.withAlpha(50),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('High Protein',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);
                                } else{
                                    return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetHighProteinDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(200),color: Colors.deepPurpleAccent.withAlpha(200),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('High Protein',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);
                                  };
                                }
                            ),





                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.only(right: width * .02 ),
                                  child: BlocBuilder<DietBloc, DietState>(
                                      bloc: BlocProvider.of<DietBloc>(context),
                                      builder: (context, state) {
                                        if(state is BalancedDietState) {
                                          return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetBalancedDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(50),color: Colors.deepPurpleAccent.withAlpha(50),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('Balanced',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);
                                        } else{
                                          return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetBalancedDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(200),color: Colors.deepPurpleAccent.withAlpha(200),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('Balanced',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);

                                        }
                                      }
                                  ),
                                ),
                              Padding(
                                padding:  EdgeInsets.only(left: width * .02),
                                child: BlocBuilder<DietBloc, DietState>(
                                    bloc: BlocProvider.of<DietBloc>(context),
                                    builder: (context, state) {
                                      if(state is KetoDietState) {
                                        return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetKetoDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(50),color: Colors.deepPurpleAccent.withAlpha(50),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('Keto',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);
                                    } else{
                                        return RaisedButton(onPressed: () => BlocProvider.of<DietBloc>(context).add(GetKetoDiet()),disabledColor: Colors.deepPurpleAccent.withAlpha(200),color: Colors.deepPurpleAccent.withAlpha(200),splashColor:Colors.deepPurpleAccent.withOpacity(1),child: Text('Keto',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),);
                                      };
                                    }
                                ),
                              )
                            ],
                          ),
                        ),






                      ],
                    ),Text('Recommended Daily Intake:',style: TextStyle(color:Colors.white.withOpacity(.5),fontSize: 20,fontWeight: FontWeight.w300 ),),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent.withAlpha(30),
                        borderRadius: BorderRadius.circular(30),
                        shape: BoxShape.rectangle,

                      ),
                      padding: EdgeInsets.only(top: 15,bottom: 15),
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Text('Calorie Intake:',style: TextStyle(color:Colors.white.withOpacity(.5),fontSize: 20,fontWeight: FontWeight.w300 ),),
                          Padding(
                            padding: const EdgeInsets.only(top: 25,bottom: 25),
                            child: Text(dailyCalorieScore.toString() +' Cal',style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w200 ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Text('Macronutrients Intake:',style: TextStyle(color:Colors.white.withOpacity(.5),fontSize: 20,fontWeight: FontWeight.w300 ),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,

                                    ),
                                    child: Text(
                                      '',

                                      style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                    ),

                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.white10,
                                        width: 2,

                                      ),
                                    ),
                                    child: Text(
                                      ' Grams  ',

                                      style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                    ),

                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.white10,
                                        width: 2,

                                      ),
                                    ),
                                    child: Text(
                                      'Calories',
                                      style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                    ),

                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.white10,
                                        width: 2,

                                      ),
                                    ),
                                    child: Text(
                                      'Protein',

                                      style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                    ),

                                  ),

                                  BlocBuilder<DietBloc, DietState>(
                                      bloc: BlocProvider.of<DietBloc>(context),
                                      builder: (context, state) {
                                        if(state is LoadingDiet) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );

                                        } else if (state is LowFatDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .26, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .26, 4) * 4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );
                                        } else if (state is HighProteinDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .34, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .34, 4) * 4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is LowCarbDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .29, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .29, 4) * 4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is BalancedDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .24, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .24, 4)*4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is KetoDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .35, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .35, 4) * 4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );
                                        }
                                      }
                                  ),


















                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.white10,
                                        width: 2,

                                      ),
                                    ),
                                    child: Text(
                                      ' Carbs ',

                                      style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                    ),

                                  ),
                                  BlocBuilder<DietBloc, DietState>(
                                      bloc: BlocProvider.of<DietBloc>(context),
                                      builder: (context, state) {
                                        if(state is LoadingDiet) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );

                                        } else if (state is LowFatDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .56, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .56, 4) *4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );
                                        } else if (state is HighProteinDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .45, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .45, 4) * 4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is LowCarbDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .42, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .42, 4) *4).toString() ,

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is BalancedDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .53, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .53, 4) *4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is KetoDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .05, 4).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .05, 4) * 4).toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );
                                        }
                                      }
                                  ),
                                ],
                              ),









                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.white10,
                                        width: 2,

                                      ),
                                    ),
                                    child: Text(
                                      '   Fats  ',

                                      style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                    ),

                                  ),
                                  BlocBuilder<DietBloc, DietState>(
                                      bloc: BlocProvider.of<DietBloc>(context),
                                      builder: (context, state) {
                                        if(state is LoadingDiet) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );

                                        } else if (state is LowFatDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .18, 9.11224).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .18, 9.11224)*9.11224).toInt().toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );
                                        } else if (state is HighProteinDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .21, 9.11224).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .21, 9.11224)*9.11224).toInt().toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is LowCarbDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .29, 9.11224).toInt().toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .29, 9.11224)*9.11224).toInt().toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is BalancedDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .23, 9.11224).toInt().toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .23, 9.11224)*9.11224).toInt().toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );

                                        } else if (state is KetoDietState) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  Macrograms(dailyCalorieScore, .60, 9.11224).toString() + 'g',

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 5,left:5 ,top:5 ,bottom:5 ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                                  borderRadius: BorderRadius.circular(10),
                                                  shape: BoxShape.rectangle,

                                                ),
                                                child: Text(
                                                  (Macrograms(dailyCalorieScore, .60, 9.11224) * 9.11224).toInt().toString(),

                                                  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),
                                                ),

                                              ),
                                            ],
                                          );
                                        }
                                      }
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text('Goal:',style: TextStyle(color:Colors.white.withOpacity(.5),fontSize: 20,fontWeight: FontWeight.w300 ),),
                    Container(
                      padding: EdgeInsets.only(top: 25,bottom: 25,left:(width * .05) ,right:(width * .05) ),
                      margin: EdgeInsets.only(top: 25,bottom: 25),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent.withAlpha(30),
                        borderRadius: BorderRadius.circular(30),
                        shape: BoxShape.rectangle,

                      ),
                      child: Text(weightGoal( profileModel.profileAttributes[profileModel.profileAttributes.length -1].goal),style: TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.w200 ),),
                    ),

                    Text('Activity:',style: TextStyle(color:Colors.white.withOpacity(.5),fontSize: 20,fontWeight: FontWeight.w300 ),),
                    Container(
                      padding: EdgeInsets.only(top: 25,bottom: 25,left:(width * .05) ,right:(width * .05) ),
                      margin: EdgeInsets.only(top: 25,bottom: 25),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent.withAlpha(30),
                        borderRadius: BorderRadius.circular(30),
                        shape: BoxShape.rectangle,

                      ),
                      child: Text(weightActivity( profileModel.profileAttributes[profileModel.profileAttributes.length -1].activity),style: TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.w200 ),),
                    ),








                    /*Padding(child: Text('Normal',style: TextStyle(color: calcCircleColor(bmiScore)),),
                      padding: EdgeInsets.only(top: 15),

                    ),*/

                    /*Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 1,
                      color: Colors.deepPurpleAccent.withAlpha(60),
                    ),*/

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
    );
  }
}

