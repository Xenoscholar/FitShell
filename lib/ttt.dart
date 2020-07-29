import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/system_bloc/system_bloc.dart';
import 'package:flutterapp2/system_bloc/system_state.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/activity.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/gender.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/goal.dart';
import 'package:flutterapp2/ui/CalculationPages/DropDowns/system.dart';
import 'package:flutterapp2/ui/unicornButton.dart';


import 'package:flutterapp2/data/moor_database.dart';

import 'bloc/profile_bloc.dart';

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

class Measurementt {
  int id;
  String unit;

  Measurementt(this.id, this.unit);

  static List<Measurementt> getMeasurements() {
    return <Measurementt>[
      Measurementt(1, 'Metric'),
      Measurementt(2, 'Imperial'),
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

  onChangeDropdownItem3(Measurementt selectedMeasurement) {
    setState(() {
      _selectedMeasurement = selectedMeasurement;
    });
  }

  List<Activity> _companies = Activity.getCompanies();
  List<DropdownMenuItem<Activity>> _dropdownMenuItemsActivities;
  Activity _selectedCompany;

  List<Goal> _goals = Goal.getGoals();
  List<DropdownMenuItem<Goal>> _dropdownMenuItemsGoals;
  Goal _selectedGoal;

  List<Measurementt> _measurements = Measurementt.getMeasurements();
  List<DropdownMenuItem<Measurementt>> _dropdownMenuItemsMeasurements;
  Measurementt _selectedMeasurement;

  @override
  void initState() {
    _dropdownMenuItemsActivities= buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItemsActivities[0].value;

    _dropdownMenuItemsGoals= buildDropdownMenuItems2(_goals);
    _selectedGoal = _dropdownMenuItemsGoals[0].value;

    _dropdownMenuItemsMeasurements= buildDropdownMenuItems3(_measurements);
    _selectedMeasurement = _dropdownMenuItemsMeasurements[0].value;
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

  List<DropdownMenuItem<Measurementt>> buildDropdownMenuItems3(List measurements) {
    List<DropdownMenuItem<Measurementt>> items = List();
    for (Measurementt measurement in measurements) {
      items.add(
        DropdownMenuItem(
          value: measurement,
          child: Text(measurement.unit),
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

    final myController4 = TextEditingController();
    final myController5 = TextEditingController();
    final myController6 = TextEditingController();

    ActivityDropDown activityDrop = ActivityDropDown();
    GenderDropDown genderDropDown = GenderDropDown();
    GoalDropDown goalDropDown = GoalDropDown();
    SystemDropDown systemDropDown = SystemDropDown();




    @override
    void dispose(TextEditingController myController1, TextEditingController myController2, TextEditingController myController3) {
      // Clean up the controller when the widget is disposed.
      myController1.dispose();
      myController2.dispose();
      myController3.dispose();
      super.dispose();
    }

    void putIntoo(AppDatabase database, TextEditingController controller1, TextEditingController controller2, TextEditingController controller3, TextEditingController controller4, TextEditingController controller5, TextEditingController controller6, ActivityDropDown activitya, GenderDropDown genderDropDownb, GoalDropDown goalDropDownb, SystemDropDown systemDropDownb) async {

      try {
        List<Profile> checkk = await database.getAllProfiles();

        database.updateTask(Profile(
          id: checkk.length,
          isMale: InsertGender(genderDropDownb),
          age: int.tryParse(controller1.text),
          weight: double.parse(controller2.text),
          height: double.parse(controller3.text),
          activity: InsertActivity(activitya),
          goal: InsertGoal(goalDropDownb),
          isMetric: InsertMeasurement(systemDropDownb),
          hip: double.tryParse(controller4.text),
          neck: double.tryParse(controller5.text),
          waist: double.tryParse(controller6.text),
        ));

      }on Error{
        database.insertTask(Profile(
          isMale: InsertGender(genderDropDownb),
          age: int.parse(controller1.text),
          weight: double.parse(controller2.text),
          height: double.parse(controller3.text),
          activity: InsertActivity(activitya),
          goal: InsertGoal(goalDropDownb),
          isMetric: InsertMeasurement(systemDropDownb),
          hip: double.tryParse(controller4.text),
          neck: double.tryParse(controller5.text),
          waist: double.tryParse(controller6.text),
        ));
      }
    }

    String hints(int calc) {

    }







    return MaterialApp(
      theme: ThemeData(
          canvasColor: Colors.deepPurple.withAlpha(150),
          primarySwatch: Colors.deepPurple
      ),
      home: Scaffold(
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
                              onPressed: () => putIntoo(BlocProvider.of<ProfileBloc>(context).appDatabase, myController1, myController2, myController3, myController4, myController4, myController6, activityDrop, genderDropDown, goalDropDown, systemDropDown),
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
                              padding: const EdgeInsets.only(top: 13,bottom: 13),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Gender:',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                                Container(
                                  padding: EdgeInsets.only(left: 7,right: 7),
                                  margin: EdgeInsets.only(left: 10,right: 0),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent.withAlpha(40),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: (width * .55) - 10,
                                  child: GenderDropDown(),
                                ),
                              ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13,bottom: 13),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('System:  ',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300)),
                                Container(
                                    padding: EdgeInsets.only(left: 7,right: 7),
                                    margin: EdgeInsets.only(left: 10,right: 0),
                                    width: (width * .55) - 10,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent.withAlpha(40),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: SystemDropDown()
                                ), ],),
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
                                    controller: myController1,
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

                            BlocBuilder<SystemBloc, SystemState>(
                                bloc: BlocProvider.of<SystemBloc>(context),
                                builder: (context, state) {
                                  if(state is MetricSystem) {
                                    return Column(
                                      children: <Widget>[


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
                                    controller: myController2,
                                    maxLength: 3,
                                    maxLengthEnforced: true,
                                    placeholder: 'pounds',
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
                                    placeholder: 'Inches',
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
                            )
                                  ],
                                  );
                            } else if (state is ImperialSystem) {
                                    return Column(
                                      children: <Widget>[


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
                                                controller: myController2,
                                                maxLength: 3,
                                                maxLengthEnforced: true,
                                                placeholder: 'Kilograms',
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
                                                placeholder: 'Centimeters',
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
                                        )
                                      ],
                                    );
                                  }
  }
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
                                  child: ActivityDropDown(),
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
                                  child: GoalDropDown(),
                                ), ],),
                            ),



    BlocBuilder<SystemBloc, SystemState>(
    bloc: BlocProvider.of<SystemBloc>(context),
    builder: (context, state) {
    if(state is MetricSystem) {
    return Column(
    children: <Widget>[
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
                                    controller: myController4,
                                    maxLength: 3,
                                    placeholder: 'Centimeters',
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
                                    controller: myController5,
                                    maxLength: 3,
                                    placeholder: 'Centimeters',
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
                                    controller: myController6,
                                    maxLength: 3,
                                    placeholder: 'Centimeters',
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
                            )
      ]);
      } else if (state is ImperialSystem) {
      return Column(
          children: <Widget>[
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
                    controller: myController4,
                    maxLength: 3,
                    placeholder: 'Inches',
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
                    controller: myController5,
                    maxLength: 3,
                    placeholder: 'Inches',
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
                    controller: myController6,
                    maxLength: 3,
                    placeholder: 'Inches',
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
            )
          ]);
      }
    }
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
      ),
    );


  }

  void radioFunction(bool e) {
    setState(() {
      groupValue = e;
    });
  }

  int InsertActivity (ActivityDropDown activityDropp){
    switch(activityDropp.createState().exposedActivity) {
      case 'Basal Metabolic Rate (BMR)': {
        return 1;
      }
      break;

      case 'Sedentary: Little or no exercise': {
        return 2;
      }
      break;

      case 'Light: Exercise 1-3 times/week': {
        return 3;
      }
      break;

      case 'moderate: Exercise 4-5 times/week': {
        return 4;
      }
      break;

      case 'Active: Daily Exercise or intense exercise 3-4 times/week': {
        return 5;
      }
      break;

      case 'Very Active: Intense exercise 6-7 times/week': {
        return 6;
      }
      break;

      case 'Extra Active: Intense Exercise daily': {
        return 7;
      }
      break;

    }


  }

  int InsertGoal (GoalDropDown goalDropDownn){
    switch(goalDropDownn.createState().exposedGoal) {
      case 'Lose Weight': {
        return 1;
      }
      break;

      case 'Maintain weight': {
        return 2;
      }
      break;

      case 'Build Muscle': {
        return 3;
      }
      break;

      case 'Recomposition (Gain Muscle + Lose Fat': {
        return 4;
      }
      break;

    }


  }

  bool InsertMeasurement (SystemDropDown systemDropDownn){
    switch(systemDropDownn.createState().exposedSystem) {
      case 'Metric': {
        return true;
      }
      break;

      case 'Imperial': {
        return false;
      }
      break;


    }


  }

  bool InsertGender (GenderDropDown genderDropDowna){
    switch(genderDropDowna.createState().exposedActivity) {
      case 'Male': {
        return true;
      }
      break;

      case 'Female': {
        return false;
      }
      break;


    }


  }






}
