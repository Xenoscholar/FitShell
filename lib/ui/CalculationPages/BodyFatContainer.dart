


import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_event.dart';
import 'package:flutterapp2/definitnion_bloc/definition_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'dart:math';




class BodyFatContainer extends StatelessWidget {
  final BuildContext context;
  final ProfileModel profileModel;


  const BodyFatContainer(this.context,this.profileModel);


  double calculateBMI(double weight, double height, bool isMetric) {

    if(isMetric == true) {
      double metersHeight = (height / 100);
      return (weight / (metersHeight * metersHeight));


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

  String limitsByGender(bool gender, int tier) {
    if(gender == true) {

      switch(tier) {
        case 1: {
          return ' 2 - 5.99%';
        }
        break;

        case 2: {
          return ' 6 - 13.99%';
        }
        break;

        case 3: {
          return ' 14 - 17.99%';
        }
        break;

        case 4: {
          return ' 18 - 25.99';
        }
        break;

        case 5: {
          return ' 26+';
        }
        break;

      }



    } else if (gender == false) {


      switch(tier) {
        case 1: {
          return ' 10 - 13.99%';
        }
        break;

        case 2: {
          return ' 14 - 20.99%';
        }
        break;

        case 3: {
          return ' 21 - 24.99%';
        }
        break;

        case 4: {
          return ' 25 - 31.99%';
        }
        break;

        case 5: {
          return ' 32+';
        }
        break;

      }


    }

  }


  /*Ideal Weight
  B. J. Devine Formula (1974)
  Male:	50.0 kg + 2.3 kg per inch over 5 feet
  Female:	45.5 kg + 2.3 kg per inch over 5 feet*/



  Color calcCircleColor(double calculation, bool gender) {

    if(gender == true) {
      if ((calculation > 0) & (calculation < 6)) {
        return Colors.blue;
      } else if ((calculation >= 6) & (calculation < 14)) {
        return Colors.greenAccent;
      } else if ((calculation >= 14) & (calculation < 18)) {
        return Colors.green;
      } else if ((calculation >= 18) & (calculation < 26)) {
        return Colors.green[800];
      } else if (calculation >= 26) {
        return Colors.red;
      }


    } else if(gender == false) {
      if ((calculation > 0) & (calculation < 14)) {
        return Colors.blue;
      } else if ((calculation >= 14) & (calculation < 21)) {
        return Colors.greenAccent;
      } else if ((calculation >= 21) & (calculation < 25)) {
        return Colors.green;
      } else if ((calculation >= 25) & (calculation < 32)) {
        return Colors.green[800];
      } else if ((calculation >= 32)) {
        return Colors.red;
      }
    }

  }

  String calcTextColor(double calculation, bool gender) {

    if(calculation != 101.23) {
      if (gender == true) {
        if ((calculation > 0) & (calculation < 6)) {
          return "Essential Fat";
        } else if ((calculation >= 6) & (calculation < 14)) {
          return "Athletes";
        } else if ((calculation >= 14) & (calculation < 18)) {
          return "Fitness";
        } else if ((calculation >= 18) & (calculation < 26)) {
          return "Average";
        } else if ((calculation >= 26)) {
          return "Obese";
        }
      } else if (gender == false) {
        if ((calculation > 0) & (calculation < 14)) {
          return "Essential";
        } else if ((calculation >= 14) & (calculation < 21)) {
          return "Athletes";
        } else if ((calculation >= 21) & (calculation < 25)) {
          return "Fitness";
        } else if ((calculation >= 25) & (calculation < 32)) {
          return "Average";
        } else if ((calculation >= 32)) {
          return "Obese";
        }
      }
    } else if(calculation == 101.23) {
      return'';
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

  Color calcHighlightleColor(double calculation, int tier, bool gender) {
    if(calculation != 101.23) {
      if (gender == true) {
        switch (tier) {
          case 1:
            {
              if ((calculation > 0) & (calculation < 6)) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;

          case 2:
            {
              if ((calculation >= 6) & (calculation < 14)) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;

          case 3:
            {
              if ((calculation >= 14) & (calculation < 18)) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;

          case 4:
            {
              if ((calculation >= 18) & (calculation < 26)) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;

          case 5:
            {
              if (calculation >= 26) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;
        }
      } else if (gender == false) {
        switch (tier) {
          case 1:
            {
              if ((calculation > 0) & (calculation < 14)) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;

          case 2:
            {
              if ((calculation >= 14) & (calculation < 21)) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;

          case 3:
            {
              if ((calculation >= 21) & (calculation < 25)) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;

          case 4:
            {
              if ((calculation >= 25) & (calculation < 32)) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;

          case 5:
            {
              if (calculation >= 32) {
                return Color(0xFF000000).withAlpha(60);
              } else {
                return Colors.transparent;
              }
            }
            break;
        }
      }
    } else if(calculation == 101.23){
      return Colors.transparent;
    }





  }


  String systemUnits(bool ssystem) {
    if(ssystem == true) {
      return ' Kgs';
    }else if (ssystem == false ) {
      return ' Lbs';
    }
  }



  double calcPreciseLeanBodyMass(bool gender, bool system ,double waist , double hip, double neck, double height, double weight) {
    try {
      if (system == true) {
        if (gender == true) {
          double waistt = cmToInch(waist);
          double neckk = cmToInch(neck);
          double heightt = cmToInch(height);

          return roundDouble(
              (86.010 * (log(waistt - neckk) / ln10) -
                  70.041 * (log(heightt) / ln10) + 36.76)
                  .toDouble(), 2);
        } else if (gender == false) {
          double waistt = cmToInch(waist);
          double hipp = cmToInch(hip);
          double neckk = cmToInch(neck);
          double heightt = cmToInch(height);

          return roundDouble(
              (163.205 * (log(waistt + hipp - neckk) / ln10) -
                  97.684 * (log(heightt) / ln10) - 78.387).toDouble(), 2);

          /*163.205×log10(waist+hip-neck) - 97.684×(log10(height)) + 36.76*/

        }
      } else if (system == false) {
        if (gender == true) {
          return roundDouble(
              (86.010 * (log(waist - neck) / ln10) -
                  70.041 * (log(height) / ln10) + 36.76)
                  .toDouble(), 2);
        } else if (gender == false) {
          return roundDouble(
              (163.205 * (log(waist + hip - neck) / ln10) -
                  97.684 * (log(height) / ln10) - 78.387).toDouble(), 2);

          /*163.205×log10(waist+hip-neck) - 97.684×(log10(height)) + 36.76*/

        }
      }
    }on Error {
      return 101.23;
    }






  }



  int calcLeanBodyPercentage(double weighttt, double leanBodyMass) {
    return ((leanBodyMass / weighttt) * 100).round();
  }




  Widget preciseYesNo(double waist , double hip, double neck, bool gender,double bodyfat) {
    if (bodyfat != 101.23) {
      if (gender == false) {
        if (waist != null && neck != null && hip != null) {
          return Container(
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.only(bottom: 18, top: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.transparent]),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: calcCircleColor(bodyfat, gender),
                    width: 2,

                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12.0,
                      spreadRadius: 13.0,
                      color: calcCircleColor(bodyfat, gender).withAlpha(50),

                    ),
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    calcPreciseLeanBodyMass(
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].isMale,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].isMetric,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].waist,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].hip,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].neck,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].height,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].weight).toString() +
                        '%',


                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '( ' + ((calcLeanBodyPercentage(
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].weight,
                        calcPreciseLeanBodyMass(
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].isMale,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].isMetric,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].waist,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].hip,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].neck,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].height,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].weight)) / 100) *
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].weight).toString() +
                        systemUnits(profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].isMetric) + ' )',

                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  )
                ],)); //lean body mass
        } else {
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
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
            child: Text(
              'Please add neck,\n waist, and hip \nmeasurements',
              /*The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).*/
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
          );
        }
      } else if (gender == true) {
        if (waist != null && neck != null) {
          return Container(
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.only(bottom: 18, top: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.transparent]),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: calcCircleColor(bodyfat, gender),
                    width: 2,

                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12.0,
                      spreadRadius: 13.0,
                      color: calcCircleColor(bodyfat, gender).withAlpha(50),

                    ),
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    calcPreciseLeanBodyMass(
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].isMale,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].isMetric,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].waist,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].hip,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].neck,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].height,
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].weight).toString() +
                        '%',


                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '( ' + ((calcLeanBodyPercentage(
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].weight,
                        calcPreciseLeanBodyMass(
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].isMale,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].isMetric,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].waist,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].hip,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].neck,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].height,
                            profileModel.profileAttributes[profileModel
                                .profileAttributes.length - 1].weight)) / 100) *
                        profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].weight).toString() +
                        systemUnits(profileModel.profileAttributes[profileModel
                            .profileAttributes.length - 1].isMetric) + ' )',

                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  )
                ],)); //lean body mass
        } else {
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
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
            child: Text(
              'Please add neck,\n waist, and hip \nmeasurements',
              /*The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).*/
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w200),
            ),
          );
        }
      }
    } else if (bodyfat == 101.23) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20,top: 20),
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
        child: Text(
          'Please add neck,\n waist, and hip \nmeasurements',
          /*The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).*/
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w200),
        ),
      );
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



    double bodyFatPercentageScore = calcPreciseLeanBodyMass(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].waist,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].hip,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].neck,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
        profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight);


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
                                        'What is Body Fat?',
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      'The body fat percentage (BFP) of a human or other living being is the total mass of fat divided by total body mass, multiplied by 100; body fat includes essential body fat and storage body fat. Essential body fat is necessary to maintain life and reproductive functions.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    IconButton(icon: Icon(Icons.cancel), onPressed: () => BlocProvider.of<DefinitionBloc>(context).add(RemoveDefinition())),
                                  ],
                                )
                            );
                          } else if (state is FalseDefinition) {

                            return Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('What is Body Fat?',
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

                    /*Container(
                        padding: EdgeInsets.all(40),
                        margin: EdgeInsets.only(bottom: 1,top: 15),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: calcCircleColor(bmiScore),
                              width: 2,

                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 12.0,
                                spreadRadius: 13.0,
                                color: calcCircleColor(bmiScore).withAlpha(50),

                              ),
                            ]),
                        child: Text(
                          roundDouble(bmiScore, 2).toString(),

                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                        ))*/preciseYesNo(profileModel.profileAttributes[profileModel.profileAttributes.length -1].waist, profileModel.profileAttributes[profileModel.profileAttributes.length -1].hip, profileModel.profileAttributes[profileModel.profileAttributes.length -1].neck, profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale,bodyFatPercentageScore),
                    Padding(child: Text(calcTextColor(bodyFatPercentageScore, profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale),style: TextStyle(color: calcCircleColor(bodyFatPercentageScore,profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale)),),
                      padding: EdgeInsets.only(top: 5),

                    ),

                    Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 1,
                      color: Colors.deepPurpleAccent.withAlpha(60),
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
                            color: calcHighlightleColor(bodyFatPercentageScore, 1,profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  color: Colors.blue,
                                  width: 20,
                                  height: 20,
                                  margin: EdgeInsets.only(right: 10),
                                ),
                                Text(
                                  'Underweight',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  limitsByGender(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale, 1),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: calcHighlightleColor(bodyFatPercentageScore, 2,profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  color: Colors.greenAccent,
                                  width: 20,
                                  height: 20,
                                  margin: EdgeInsets.only(right: 10),
                                ),
                                Text(
                                  'Athletes',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  limitsByGender(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale, 2),
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: calcHighlightleColor(bodyFatPercentageScore, 3,profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale),
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
                                  'Fitness',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  limitsByGender(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale, 3),
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: calcHighlightleColor(bodyFatPercentageScore, 4,profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  color: Colors.green[800],
                                  width: 20,
                                  height: 20,
                                  margin: EdgeInsets.only(right: 10),
                                ),
                                Text(
                                  'Average',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  limitsByGender(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale, 4),
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: calcHighlightleColor(bodyFatPercentageScore, 5,profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale),
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
                                  'Obese',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  limitsByGender(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale, 5),
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
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