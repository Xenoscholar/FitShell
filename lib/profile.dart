/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bmi.dart';
import 'package:flutterapp2/profile_rows.dart';
import 'package:flutterapp2/ui/bmi_page.dart';

import 'package:provider/provider.dart';

import 'package:flutterapp2/data/moor_database.dart';

import 'bloc/profile_bloc.dart';
import 'bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {

  bool groupValue;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final myController1 = TextEditingController();
    final myController2 = TextEditingController();
    final myController3 = TextEditingController();




    */
/*final AppDatabase database = Provider.of<AppDatabase>(context);
    final ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);*//*


    @override
    void dispose(TextEditingController myController1, TextEditingController myController2, TextEditingController myController3) {
      // Clean up the controller when the widget is disposed.
      myController1.dispose();
      myController2.dispose();
      myController3.dispose();
      super.dispose();
    }

    void putIntoo(AppDatabase database, TextEditingController controller1, TextEditingController controller2, TextEditingController controller3 ) async {
      */
/*dispose(controller1, controller2, controller3);*//*


       */
/* FutureBuilder(
          future: database.getAllProfiles(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data.length == 0) {
              database.insertTask(Profile(id: null, isMale: true, age: int.parse(controller1.text), weight: int.parse(controller2.text), height: int.parse(controller3.text)));
            } else {
              database.updateTask(Profile(id: null, isMale: true, age: int.parse(controller1.text), weight: int.parse(controller2.text), height: int.parse(controller3.text)));
            }
          },
        );
*//*

        */
/*List<Profile> checkk = await database.getAllProfiles();*//*


        try {
          List<Profile> checkk = await database.getAllProfiles();

          database.updateTask(Profile(
              id: checkk.length,
              isMale: groupValue,
              age: int.parse(controller1.text),
              weight: int.parse(controller2.text),
              height: int.parse(controller3.text)));

        }on Error{
          database.insertTask(Profile(
              isMale: groupValue,
              age: int.parse(controller1.text),
              weight: int.parse(controller2.text),
              height: int.parse(controller3.text)));
        }







      */
/*if (database.getAllProfiles() == Error) {
        *//*
*/
/*database.getAllProfiles();*//*
*/
/*

        database.insertTask(Profile(
            isMale: true,
            age: int.parse(controller1.text),
            weight: int.parse(controller2.text),
            height: int.parse(controller3.text)));




      } else {
        List<Profile> checkk = await database.getAllProfiles();

        database.updateTask(Profile(
          id: checkk.length,
            isMale: true,
            age: int.parse(controller1.text),
            weight: int.parse(controller2.text),
            height: int.parse(controller3.text)));
      }*//*


        */
/*database.insertTask(Profile(
            isMale: true,
            age: int.parse(controller1.text),
            weight: int.parse(controller2.text),
            height: int.parse(controller3.text)));*//*





      */
/*if the size of the list of entries in the database is 0, then use the insertTask method with profile info
      * if size is 1, then use the updateTask method to update the already existing entry
      * ENTRY LIST SHOULD NEVER EXCEED 1!!!*//*


    }


    */
/*@override
    initState() {
      super.initState();


    }*//*




    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
            ),
            alignment: Alignment.center,
          ),
        */
/*  BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {

              }
          ),*//*

          Center(
              */
/*padding: EdgeInsets.all(20),*//*

              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.grey[800].withOpacity(.7),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  alignment: Alignment.center,
                  height: height * .65,
                  width: width * .8,
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Gender:',
                              style: TextStyles.appNameTextStyle,
                            ),
                            Spacer(),
                            Text('Age:',
                              style: TextStyles.appNameTextStyle,
                            ),
                            Spacer(),
                            Text('Weight:',
                              style: TextStyles.appNameTextStyle,
                            ),
                            Spacer(),
                            Text('Height:',
                              style: TextStyles.appNameTextStyle,)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Gender:',
                              style: TextStyles.appNameTextStyle,
                            ),

                            Center(
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                        'Male',
                                      style: TextStyle(
                                        color: Colors.blue
                                      ),
                                    ),
                                    Radio(value: true, groupValue: groupValue, activeColor: Colors.purple, onChanged: (bool e) => radioFunction(e)),
                                    Text(
                                      'Male',
                                      style: TextStyle(
                                          color: Colors.purpleAccent[100]
                                      ),
                                    ),
                                    Radio(value: false, groupValue: groupValue, activeColor: Colors.purple, onChanged: (bool e) => radioFunction(e)),
                                  ],
                                ),
                            ),

                            Spacer(),
                            CupertinoTextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              controller: myController1,
                              maxLength: 2,
                              maxLengthEnforced: true,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.2)
                              ),
                              style: TextStyle(
                                color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            CupertinoTextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              controller: myController2,
                              maxLength: 3,
                              maxLengthEnforced: true,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.2)
                              ),
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            CupertinoTextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              controller: myController3,
                              maxLength: 3,
                              maxLengthEnforced: true,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.2)
                              ),
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Column(
              children: <Widget>[
                RaisedButton(onPressed: () {
                  putIntoo(BlocProvider.of<ProfileBloc>(context).appDatabase, myController1, myController2, myController3);
                  AlertDialog(
                    title: Text('Profile Updated'),
                    content: Text('Your profile has been updated.'),
                  );
                },
                  color: Colors.red,
                  child: Text('Save'),
                ),
              Spacer(),
          */
/*RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bmi()),
                );
              },
            color: Colors.yellow,
          ),*//*

              ],
            ),
          ),
        ],
      ),
    );


    return Provider<int>(
      child:Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Image.asset(
              'background_pics/profile_bg_page.jpg',
              fit: BoxFit.fill,
              height: height,
              width: width,
              alignment: Alignment.center,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withOpacity(.4),
                    Colors.blueAccent.withOpacity(.4)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.center,
            ),
            Center(
              */
/*padding: EdgeInsets.all(20),*//*

              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.black26.withOpacity(.4),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  alignment: Alignment.center,
                  height: height * .65,
                  width: width * .8,
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Gender:',
                              style: TextStyles.appNameTextStyle,
                            ),
                            Spacer(),
                            Text('Age:',
                              style: TextStyles.appNameTextStyle,
                            ),
                            Spacer(),
                            Text('Weight',
                              style: TextStyles.appNameTextStyle,
                            ),
                            Spacer(),
                            Text('Height',
                              style: TextStyles.appNameTextStyle,)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Gender:',
                              style: TextStyles.appNameTextStyle,
                            ),
                            Spacer(),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              controller: myController1,
                              maxLength: 2,
                              maxLengthEnforced: true,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              controller: myController2,
                              maxLength: 3,
                              maxLengthEnforced: true,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              controller: myController3,
                              maxLength: 3,
                              maxLengthEnforced: true,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            RaisedButton(onPressed: () {
              BlocProvider.of<ProfileBloc>(context).appDatabase.insertTask(Profile(id: null, isMale: true, age: int.parse(myController1.toString()), weight: int.parse(myController2.toString()), height: int.parse(myController3.toString())));
              AlertDialog(
                title: Text('Profile Updated'),
                content: Text('Your profile has been updated.'),
              );
            },
            ),
          ],
        ),
      ),
    );


  }

  void radioFunction(bool e) {
    setState(() {
      groupValue = e;
    });
  }




}*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/bmi.dart';
import 'package:flutterapp2/profile_rows.dart';
import 'package:flutterapp2/ui/bmi_page.dart';
import 'package:flutterapp2/ui/unicornButton.dart';

import 'package:provider/provider.dart';

import 'package:flutterapp2/data/moor_database.dart';

import 'bloc/profile_bloc.dart';
import 'bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class Activity {
  int id;
  String name;

  Activity(this.id, this.name);

  static List<Activity> getCompanies() {
    return <Activity>[
      Activity(1, 'Basal Metabolic Rate (BMR)'),
      Activity(2, 'Sedentary: Little or no exercise'),
      Activity(3, 'Light: Exercise 1-3 times/week'),
      Activity(4, 'moderate: Exercise 4-5 times/week'),
      Activity(5, 'Active: Daily Exercise or intense exercise 3-4 times/week'),
      Activity(6, 'Very Active: Intense exercise 6-7 times/week'),
      Activity(7, 'Extra Active: Intense Exercise daily'),
    ];
  }
}

class Goal {
  int id;
  String name;

  Goal(this.id, this.name);

  static List<Goal> getGoals() {
    return <Goal>[
      Goal(1, 'Lose Weight'),
      Goal(2, 'Maintain weight'),
      Goal(3, 'Build Muscle'),
      Goal(4, 'Recomposition (Gain Muscle + Lose Fat')
    ];
  }
}



class _ProfileState extends State<ProfilePage> {

  onChangeDropdownItem(Activity selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  onChangeDropdownItem2(Goal selectedGoal) {
    setState(() {
      _selectedGoal = selectedGoal;
    });
  }

  List<Activity> _companies = Activity.getCompanies();
  List<DropdownMenuItem<Activity>> _dropdownMenuItemsActivities;
  Activity _selectedCompany;

  List<Goal> _goals = Goal.getGoals();
  List<DropdownMenuItem<Goal>> _dropdownMenuItemsGoals;
  Goal _selectedGoal;

  @override
  void initState() {
    _dropdownMenuItemsActivities= buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItemsActivities[0].value;

    _dropdownMenuItemsGoals= buildDropdownMenuItems2(_goals);
    _selectedGoal = _dropdownMenuItemsGoals[0].value;
    super.initState();
  }






  List<DropdownMenuItem<Activity>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Activity>> items = List();
    for (Activity company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<Goal>> buildDropdownMenuItems2(List goals) {
    List<DropdownMenuItem<Goal>> items = List();
    for (Goal goal in goals) {
      items.add(
        DropdownMenuItem(
          value: goal,
          child: Text(goal.name),
        ),
      );
    }
    return items;
  }


  bool groupValue;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final myController1 = TextEditingController();
    final myController2 = TextEditingController();
    final myController3 = TextEditingController();



    @override
    void dispose(TextEditingController myController1, TextEditingController myController2, TextEditingController myController3) {
      // Clean up the controller when the widget is disposed.
      myController1.dispose();
      myController2.dispose();
      myController3.dispose();
      super.dispose();
    }

    void putIntoo(AppDatabase database, TextEditingController controller1, TextEditingController controller2, TextEditingController controller3 ) async {

      try {
        List<Profile> checkk = await database.getAllProfiles();

        database.updateTask(Profile(
            id: checkk.length,
            isMale: groupValue,
            age: int.parse(controller1.text),
            weight: double.parse(controller2.text),
            height: double.parse(controller3.text)));

      }on Error{
        database.insertTask(Profile(
            isMale: groupValue,
            age: int.parse(controller1.text),
            weight: double.parse(controller2.text),
            height: double.parse(controller3.text)));
      }
    }






    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text('Profile',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  /*color: Color(0xff4a4a4a)*/
                  color: Colors.deepPurpleAccent.withAlpha(30)
                ),
                width: width,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    /*Container(
                    this is the profile box for profile
                      height: 200,
                      color: Colors.orange,
                      margin: EdgeInsets.only(bottom: 20),
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          height: 50,
                          width: (width * .5) - 30,
                          margin: EdgeInsets.only(left: 5,right: 5,),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: UnicornOutlineButton(
                            strokeWidth: 2,
                            radius: 24,
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.white12]),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Edit',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white)),
                              ],
                            ),
                            /*onPressed: () =>
                                      BlocProvider.of<CalculationBloc>(context)
                                          .add(GetMacronutrients())*/),

                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          margin: EdgeInsets.only(left: 5,right: 5),
                          height: 50,
                          width: (width * .5) - 30,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: UnicornOutlineButton(
                                  strokeWidth: 2,
                                  radius: 24,
                                  gradient: LinearGradient(
                                    colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,

                                    children: <Widget>[
                                      Text('Save',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  /*onPressed: () =>
                                      BlocProvider.of<CalculationBloc>(context)
                                          .add(GetMacronutrients())*/),

                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 2),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.max,children: <Widget>[Text(
                                'Gender: ',
                            style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                                Container(
                                  width: (width * .58) - 5,
                                  padding: EdgeInsets.only(left: 30),
                                  margin: EdgeInsets.only(right: 5),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Male',
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                        ),
                                        Radio(value: true, groupValue: groupValue, activeColor: Colors.purple, onChanged: (bool e) => radioFunction(e)),
                                        Text(
                                          'Female',
                                          style: TextStyle(
                                              color: Colors.purpleAccent[100]
                                          ),
                                        ),
                                        Radio(value: false, groupValue: groupValue, activeColor: Colors.purple, onChanged: (bool e) => radioFunction(e)),
                                      ],
                                    ),
                                  ),
                                ),


                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Age:       ',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                              Container(
                                width: width -150,
                                child: CupertinoTextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  controller: myController3,
                                  maxLength: 3,
                                  maxLengthEnforced: true,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent.withAlpha(40),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Weight: ',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                              Container(
                                width: width -150,
                                child: CupertinoTextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  controller: myController3,
                                  maxLength: 3,
                                  maxLengthEnforced: true,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent.withAlpha(40),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Height:  ',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                              Container(
                                width: width -150,
                                child: CupertinoTextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  controller: myController3,
                                  maxLength: 3,
                                  maxLengthEnforced: true,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent.withAlpha(40),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Activity:',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                                  Container(
                                    padding: EdgeInsets.only(left: 7,right: 7),
                                    margin: EdgeInsets.only(left: 10,right: 0),
                                    decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent.withAlpha(40),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                    width: (width * .55) - 10,
                                    child: DropdownButton(
                                          value: _selectedCompany,
                                          items: _dropdownMenuItemsActivities,
                                          onChanged: onChangeDropdownItem,
                                      isExpanded: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      focusColor: Colors.grey.withOpacity(.5),
                                        )
                                  ),
                              ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Goal:     ',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                              Container(
                                  padding: EdgeInsets.only(left: 7,right: 7),
                                  margin: EdgeInsets.only(left: 10,right: 0),
                                  width: (width * .55) - 10,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent.withAlpha(40),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: DropdownButton(
                                      value: _selectedGoal,
                                      items: _dropdownMenuItemsGoals,
                                      onChanged: onChangeDropdownItem2,
                                      isExpanded: true,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      focusColor: Colors.grey.withOpacity(.5),
                                    )
                                ), ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Neck:    ',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                              Container(
                                width: width -150,
                                child: CupertinoTextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  controller: myController3,
                                  maxLength: 3,
                                  maxLengthEnforced: true,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent.withAlpha(40),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Waist:   ',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                              Container(
                                width: width -150,
                                child: CupertinoTextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  controller: myController3,
                                  maxLength: 3,
                                  maxLengthEnforced: true,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent.withAlpha(40),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 13),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Hip:       ',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                              Container(
                                width: width -150,
                                child: CupertinoTextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  controller: myController3,
                                  maxLength: 3,
                                  maxLengthEnforced: true,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent.withAlpha(40),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )],),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );


  }

  void radioFunction(bool e) {
    setState(() {
      groupValue = e;
    });
  }




}
