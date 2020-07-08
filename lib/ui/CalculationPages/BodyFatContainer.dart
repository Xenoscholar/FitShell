


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

  double calculateBMI(double weight, double height) {
    return (703 * (weight / (height * height))).toDouble();
  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }


  @override
  Column build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
                            ));
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
                                    color: Colors.green,
                                    width: 2,

                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 12.0,
                                      spreadRadius: 13.0,
                                      color: Colors.green.withAlpha(50),

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
                          Padding(child: Text('Normal',style: TextStyle(color: Colors.greenAccent),),
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