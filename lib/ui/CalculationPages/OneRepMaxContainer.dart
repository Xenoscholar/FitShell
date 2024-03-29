import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_event.dart';
import 'package:flutterapp2/definitnion_bloc/definition_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'dart:math';




class OneRepMaxContainer extends StatelessWidget {
  final BuildContext context;
  final ProfileModel profileModel;


  const OneRepMaxContainer(this.context,this.profileModel);

  double calculateBMI(double weight, double height, bool isMetric) {

    if(isMetric == true) {
      double metersHeight = (height / 100);
      return weight / (metersHeight * metersHeight);


    }else if (isMetric == false) {
      return (703 * (weight / (height * height)));

    }

  }

  Widget preciseYesNo(double waist , double hip, double neck, bool gender) {
    if(gender == false) {
      if( waist != null && neck != null && hip != null) {
        return Container(
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.only(bottom: 50,top: 15),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withAlpha(50),
                  width: 2,

                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    spreadRadius: 13.0,
                    color: Colors.white.withAlpha(50),

                  ),
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  calcPreciseLeanBodyMass(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].waist,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].hip,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].neck,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight).toString() +systemUnits(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric),



                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                ),
                Text(
                  '( ' + "leanBodyMassPercentage" + '%' + ' )',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                )
              ],)) ; //lean body mass
      } else {
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

    }else if (gender == true) {
      if( waist != null && neck != null) {
        return Container(
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.only(bottom: 50,top: 15),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withAlpha(50),
                  width: 2,

                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    spreadRadius: 13.0,
                    color: Colors.white.withAlpha(50),

                  ),
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  calcPreciseLeanBodyMass(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].waist,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].hip,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].neck,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight).toString() +systemUnits(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric),



                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                ),
                Text(
                  '( ' + calcLeanBodyPercentage(profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight, calcPreciseLeanBodyMass(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].waist,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].hip,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].neck,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].height,
                      profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight)).toString() + '%' + ' )',

                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                )
              ],)); //lean body mass
      } else {
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

  double calcPreciseLeanBodyMass(bool gender, bool system ,double waist , double hip, double neck, double height, double weight) {

    if (system == true) {


      if (gender == true) {

        double waistt = cmToInch(waist);
        double neckk = cmToInch(neck);
        double heightt = cmToInch(height);

        return roundDouble(
            (((100 - (86.010 * (log(waistt - neckk) / ln10) - 70.041 * (log(heightt) / ln10) + 36.76)) / 100) * weight)
                .toDouble(), 2);
      } else if (gender == false) {
        double waistt = cmToInch(waist);
        double hipp = cmToInch(hip);
        double neckk = cmToInch(neck);
        double heightt = cmToInch(height);

        return roundDouble(
            (((100 - (163.205 * (log(waistt + hipp - neckk) / ln10) - 97.684 * (log(heightt) / ln10) - 78.387)) / 100) * weight).toDouble(), 2);

        /*163.205×log10(waist+hip-neck) - 97.684×(log10(height)) + 36.76*/

      }

    } else if (system == false) {
      if (gender == true) {
        return roundDouble(
            (((100 -(86.010 * (log(waist - neck) / ln10) - 70.041 * (log(height) / ln10) + 36.76)) / 100 )* weight)
                .toDouble(), 2);
      } else if (gender == false) {
        return roundDouble(
            (((100 -(163.205 * (log(waist + hip - neck) / ln10) - 97.684 * (log(height) / ln10) - 78.387)) / 100 )* weight).toDouble(), 2);

        /*163.205×log10(waist+hip-neck) - 97.684×(log10(height)) + 36.76*/

      }
    }






  }


  /*String calcPreciseLeanBodyMass(bool gender, bool system ,double waist , double hip, double neck, double height) {

    try {
      if (system == true) {


        if (gender == true) {

          double waistt = cmToInch(waist);
          double neckk = cmToInch(neck);
          double heightt = cmToInch(height);

          return roundDouble(
              (86.010 * (log(waistt - neckk) / ln10) - 70.041 * (log(heightt) / ln10) + 36.76)
                  .toDouble(), 2).toString();
        } else if (gender == false) {
          double waistt = cmToInch(waist);
          double hipp = cmToInch(hip);
          double neckk = cmToInch(neck);
          double heightt = cmToInch(height);

          return roundDouble(
              (163.205 * (log(waistt + hipp - neckk) / ln10) - 97.684 * (log(heightt) / ln10) - 78.387).toDouble(), 2).toString();

          *//*163.205×log10(waist+hip-neck) - 97.684×(log10(height)) + 36.76*//*

        }

      } else if (system == false) {
        if (gender == true) {
          return roundDouble(
              (86.010 * (log(waist - neck) / ln10) - 70.041 * (log(height) / ln10) + 36.76)
                  .toDouble(), 2).toString();
        } else if (gender == false) {
          return roundDouble(
              (163.205 * (log(waist + hip - neck) / ln10) - 97.684 * (log(height) / ln10) - 78.387).toDouble(), 2).toString();

          *//*163.205×log10(waist+hip-neck) - 97.684×(log10(height)) + 36.76*//*

        }
      }
    }on Error{
      return 'Please add neck,\n waist, and hip \nmeasurements';
    }





  }*/


  String systemUnits(bool ssystem) {
    if(ssystem == true) {
      return ' Kgs';
    }else if (ssystem == false ) {
      return ' Lbs';
    }
  }

  /*String calcPreciseLeanBodyMass(bool gender, bool system ,double waist , double hip, double neck, double height) {

    try {
      if (system == true) {
        if (gender == true) {
          return roundDouble(495 / 1.0324 - 0.19077 * log(waist - neck) +
              0.15456 * log(height), 2).toString();
        } else if (gender == false) {
          return roundDouble(495 / 1.29579 - 0.35004 * log(waist - neck) +
              0.22100 * log(height), 2).toString();
        }
      } else if (system == false) {
        if (gender == true) {
          double wn = log(waist - neck) / ln10;
          double h = log(height) / ln10;
          return roundDouble(
              (86.010 * (log(waist - neck) / ln10) - 70.041 * (log(height) / ln10) + 36.76)
                  .toDouble(), 2).toString();
        } else if (gender == false) {
          return roundDouble(
              (163.205 * log(waist + hip - neck) - 97.684 * (log(height)) +
                  36.76), 2).toString();
        }
      }
    }on Error{
      return 'no';
    }





  }*/




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
                                        'What is Lean Body Mass?',
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      'Lean body mass, or fat-free mass, is a component of body composition, calculated by subtracting body fat weight from total body weight: total body weight is lean plus fat.',
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
                                    Text('What is Lean Body Mass?',
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



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('Bmi Estimate',style: TextStyle(color: Colors.white.withAlpha(100)),),
                            Container(
                                padding: EdgeInsets.all(30),
                                margin: EdgeInsets.only(bottom: 50,top: 15),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withAlpha(50),
                                      width: 2,

                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        spreadRadius: 13.0,
                                        color: Colors.white.withAlpha(50),

                                      ),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        leanBodyMassScore.toString() + systemUnits(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric),

                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Text(
                                      '( ' + leanBodyMassPercentage + '%' + ' )',

                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                    )
                                  ],
                                )),
                          ],
                        ),







                        Column(
                          children: <Widget>[
                            Text('Precise',style: TextStyle(color: Colors.white.withAlpha(100)),),
                            preciseYesNo(profileModel.profileAttributes[profileModel.profileAttributes.length -1].waist,
                                profileModel.profileAttributes[profileModel.profileAttributes.length -1].hip,
                                profileModel.profileAttributes[profileModel.profileAttributes.length -1].neck,
                                profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMale
                            ),
                          ],
                        )




                      ],
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

