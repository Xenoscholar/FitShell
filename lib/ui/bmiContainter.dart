


import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_event.dart';
import 'package:flutterapp2/definitnion_bloc/definition_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'dart:math';




class BmiContainer extends StatelessWidget {
  final BuildContext context;
  final ProfileModel profileModel;


  const BmiContainer(this.context,this.profileModel);

  double calculateBMI(double weight, double height) {
    return (703 * (weight / (height * height))).toDouble();
  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

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
            .height), 2));

    return Column(
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
                                    'What is BMI?',
                                    style: TextStyle(fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  'Body Mass Index (BMI) is a measurement of a person’s weight in regards to their height. It is used to give an approximation of a person’s total body fat.'
                                'BMI usually correlates with total body fat. Typically, body fat increases as BMI score increases.',
                                /*The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).*/
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200),
                                ),
                                IconButton(icon: Icon(Icons.cancel), onPressed: () => BlocProvider.of<DefinitionBloc>(context).add(RemoveDefinition())),
                              ],
                            ));
                      } else if (state is FalseDefinition) {

                        return Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('What is BMI?',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.5)
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => BlocProvider.of<DefinitionBloc>(context).add(GetDefinition()),
                                  icon: Icon(Icons.info),
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
                  padding: EdgeInsets.all(1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(children: <Widget>[
                          Icon(Icons.whatshot, color: Colors.white30,),
                          Text('Ideal Weight',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
                          Text('1,717 Cal',style: TextStyle(color: Colors.white,fontSize: 10),)],),
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
                        margin: EdgeInsets.only(top: 5),


                      ),

















                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(left: 2),
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
                              Icon(Icons.whatshot, color: Colors.white30,),
                              Text('BMR',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
                              Text('1,717 Cal',style: TextStyle(color: Colors.white,fontSize: 10),)],),
                          ),

                          Container(
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
                                bmiScore.toString(),

                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                              )),
                          Padding(child: Text('Normal',style: TextStyle(color: calcCircleColor(bmiScore)),),
                            padding: EdgeInsets.only(top: 15),

                          )

                        ],
                      ),

















                      Container(
                        child: Container(
                          child: Column(children: <Widget>[
                            Icon(Icons.whatshot, color: Colors.white30,),
                            Text('Caloric',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
                            Text('Maintenance',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
                            Text('1,717 Cal',style: TextStyle(color: Colors.white,fontSize: 10),)],),

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
                        margin: EdgeInsets.only(top: 4),
                      ),

                    ],
                  ),
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
                        color: calcHighlightleColor(bmiScore, 1),
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
                                '<18.5',
                                textAlign: TextAlign.end,
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                              ),
                          ],
                        ),
                      ),
                      Container(
                        color: calcHighlightleColor(bmiScore, 2),
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
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '18.5 - 24.9',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: calcHighlightleColor(bmiScore, 3),
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
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '25 - 29.9',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: calcHighlightleColor(bmiScore, 4),
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
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '<30 - 34.9',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: calcHighlightleColor(bmiScore, 5),
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
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '35 +',
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
        Container(
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
        ),
      ],
    );
  }
}