


import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_bloc.dart';
import 'package:flutterapp2/definitnion_bloc/definition_event.dart';
import 'package:flutterapp2/definitnion_bloc/definition_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'dart:math';




class IdealWeightContainer extends StatelessWidget {
  final BuildContext context;
  final ProfileModel profileModel;

  const IdealWeightContainer(this.context,this.profileModel);

  double calculateIdealWeight(double height, bool gender /*add another bool argument for unit of measurement+*/ ) {
    if(gender == true) {
      /*place if statement here and return based on metric or customary*/
      return ((((height - 60) * 1.41) + 56.2) * 2.2).toDouble();
    } else {
      /*place if statement here and return based on metric or customary*/
      return (((height - 60) * 1.36) + 53.1).toDouble();
    }
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
                                    'What is Ideal Weight?',
                                    style: TextStyle(fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  'Ideal weight is an approximation of how much you should way in relation to your height and gender.',
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
                                Text('What is Ideal Weight?',
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
                      roundDouble(calculateIdealWeight(
                          profileModel
                              .profileAttributes[
                          profileModel.profileAttributes.length - 1]
                              .height,
                          profileModel
                              .profileAttributes[
                          profileModel.profileAttributes.length - 1]
                              .isMale), 2).toString(),

                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                    )),

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