import 'package:flutter/material.dart';
import 'package:flutterapp2/nav_bloc/navigation_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/bloc/profile_event.dart';
import 'package:flutterapp2/bloc/profile_state.dart';
import 'package:flutterapp2/models/profile_model.dart';


class BmrNavPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    loadInitialPageViaData(context);

    return Scaffold(
      body: Container(
        /*padding: EdgeInsets.symmetric(vertical: 16),*/
        alignment: Alignment.center,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial) {
              return buildInitialInput();
            } else if (state is ProfileLoading) {
              return buildLoading();
            } else if (state is ProfileLoaded) {
              return buildContainerWithData(context, state.profileModel, screenHeight, screenWidth);
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
      /*child: CityInputField(),*/
        child: Text('There was an error. Be sure to complete your profile.')
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void loadInitialPageViaData(BuildContext context) {
    print('YASSSSSSSSSSSSSSSSSSSSSSS');

    BlocProvider.of<ProfileBloc>(context).add(GetProfile());

    /*if(BlocProvider.of<ProfileBloc>(context).appDatabase.getAllProfiles() == null) {
      throw Error();
    }else{
      BlocProvider.of<ProfileBloc>(context).add(GetProfile());
    }*/
  }

  double calculateBMR(int height, int weight, bool gender, int age) {

    double weightKg = weight / 2.205;
    double heightCm = height * 2.54;

    if(gender == true) {
      /*place if statement here and return based on metric or customary*/
      return ((13.39 * weightKg) + (4.799 * heightCm) - (5.677 * age) + (88.362)).toDouble();
    } else {
      /*place if statement here and return based on metric or customary*/
      return ((9.247 * weightKg) + (3.098 * heightCm) - (4.330 * age) + (447.593)).toDouble();
    }
  }


  Container buildContainerWithData(BuildContext context, ProfileModel profileModel, double height, double width) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[800].withOpacity(.7),
      child: Container(
        color: Colors.grey[800].withOpacity(.7),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(30),
        height: height,
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                'Ideal Weight',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
            ),



            Container(
                color: Colors.green,
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  calculateBMR(profileModel.profileAttributes[profileModel.profileAttributes.length - 1].height,profileModel.profileAttributes[profileModel.profileAttributes.length - 1].weight, profileModel.profileAttributes[profileModel.profileAttributes.length - 1].isMale, profileModel.profileAttributes[profileModel.profileAttributes.length - 1].age).toInt().toString() + '  Calories/day',
                  style:TextStyle(
                      color: Colors.white
                  ),
                )
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: Text(
                'Moderate Condition',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                ),
              ),
            ),

            Column( /*Column for ranges of Bmi*/
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,


              /*mainAxisAlignment: MainAxisAlignmen,*/
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
                        style:TextStyle(
                            color: Colors.white
                        ),
                      ),
                      Text('<18.5',
                        style:TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[800],
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
                      Text('Normal',
                        style:TextStyle(
                            color: Colors.white
                        ),
                      ),
                      Text('18.5 - 24.9',
                        style:TextStyle(
                            color: Colors.white
                        ),
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
                      Text('Overweight',
                        style:TextStyle(
                            color: Colors.white
                        ),
                      ),
                      Text('25 - 29.9',
                        style:TextStyle(
                            color: Colors.white
                        ),
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
                      Text('Obese',
                        style:TextStyle(
                            color: Colors.white
                        ),
                      ),
                      Text('<30 - 34.9',
                        style:TextStyle(
                            color: Colors.white
                        ),
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
                      Text('Very Obese',
                        style:TextStyle(
                            color: Colors.white
                        ),
                      ),
                      Text('35 +',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                        style:TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}