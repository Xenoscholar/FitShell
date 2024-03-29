


import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_event.dart';
import 'package:flutterapp2/definitnion_bloc/definition_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'dart:math';




class InitialPagee extends StatelessWidget {
  final BuildContext context;
  final ProfileModel profileModel;

  const InitialPagee(this.context,this.profileModel);

  double calculateBMI(double weight, double height) {
    return (703 * (weight / (height * height))).toDouble();
  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }


  @override
  Column build(BuildContext context) {
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
                                    'What is BMR',
                                    style: TextStyle(fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  'The Basal Metabolic Rate (BMR) is an estimate of the amount of energy expended while at rest in a neutral environment, and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting).',
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
                    padding: EdgeInsets.all(40),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
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
                      roundDouble(calculateBMI(
                          profileModel
                              .profileAttributes[
                          profileModel.profileAttributes.length - 1]
                              .weight,
                          profileModel
                              .profileAttributes[
                          profileModel.profileAttributes.length - 1]
                              .height), 2).toString(),

                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
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
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '<18.5',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
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
          margin: EdgeInsets.only(top: 20),

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff4a4a4a),
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