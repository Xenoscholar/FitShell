import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_event.dart';
import 'package:flutterapp2/definitnion_bloc/definition_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'dart:math';




class CreatineContainer extends StatelessWidget {
  final BuildContext context;
  final ProfileModel profileModel;


  const CreatineContainer(this.context,this.profileModel);





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











  String creatineIntake(bool system, double weight, int tier) {
    if(system == true) {
      if(tier == 1) {
        return (weight * 0.3).toInt().toString() + 'g';
      }else if (tier == 2) {
        double newWeight = kgToPounds(weight);

        if(newWeight < 120){
          return '3g';
        }else if((newWeight >= 120 )&& (newWeight <= 200)) {
          return '5g';
        }else if(newWeight > 200) {
          return '8g';
        }

      }
    }else if (system == false) {
      if(tier ==1){
        double newWeightt = poundsToKg(weight);
        return (newWeightt * 0.3).toInt().toString() + 'g';
      }else if(tier == 2) {
        if(weight < 120){
          return '3g';
        }else if((weight >= 120 )&& (weight <= 200)) {
          return '5g';
        }else if(weight > 200) {
          return '8g';
        }
      }
    }

  }





  @override
  Column build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;






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
                                        'What is Creatine?',
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      'Creatine is a substance that is used to make ATP, which provides energy for muscles. It is used to enhance exercise performance, increase muscle mass, and boost strength.',
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
                                    Text('What is Creatine?',
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

                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          color: Colors.deepPurpleAccent.withAlpha(30)
                            ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10, top: 10),
                              child: Text(
                                'What is Loading Phase?',
                                style: TextStyle(fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              'During loading phase, creatine is taken in higher doses for the first 5 - 7 days in order for creatine to work faster. For Example, 20g of creatine during loading phase would mean getting 20g of creatine daily while splitting up the dosage into 4 dosages of 5g each.',
                              /*The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).*/
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        )),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('Loading Phase',style: TextStyle(color: Colors.white.withAlpha(100)),),
                            Container(
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
                                      creatineIntake(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric, profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight, 1),



                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,fontSize: 20),
                                    ),
                                  ],)),
                          ],
                        ),







                        Column(
                          children: <Widget>[
                            Text('Maintenance Phase',style: TextStyle(color: Colors.white.withAlpha(100)),),
                            Container(
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
                                      creatineIntake(profileModel.profileAttributes[profileModel.profileAttributes.length -1].isMetric, profileModel.profileAttributes[profileModel.profileAttributes.length -1].weight, 2),



                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,fontSize: 20),
                                    ),
                                  ],)) ,
                          ],
                        )




                      ],
                    ),

                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.deepPurpleAccent.withAlpha(30)
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10, top: 10),
                              child: Text(
                                'What is Maintenance Phase?',
                                style: TextStyle(fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              'The maintenance phase comes after the loading phase which includes taking smaller doses since the muscles already have optimal levels of creatine. The maintenance dose should be taken every day after the loading phase to keep sufficient creatine levels.',
                              /*The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).*/
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        )),



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

