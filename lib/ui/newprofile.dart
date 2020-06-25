import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/bmi.dart';
import 'package:flutterapp2/profile_rows.dart';
import 'package:flutterapp2/ui/bmi_page.dart';

import 'package:provider/provider.dart';

import 'package:flutterapp2/data/moor_database.dart';

/*import 'bloc/profile_bloc.dart';
import 'bloc/profile_state.dart';*/

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
            weight: int.parse(controller2.text),
            height: int.parse(controller3.text)));

      }on Error{
        database.insertTask(Profile(
            isMale: groupValue,
            age: int.parse(controller1.text),
            weight: int.parse(controller2.text),
            height: int.parse(controller3.text)));
      }
    }






    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[800].withOpacity(.7),
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                color: Colors.orange,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 20,
                    color: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.edit),
                        Text('Edit')
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                    color: Colors.purple,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.save),
                        Text('Save')
                      ],
                    ),
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Gender:')],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Age:')],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Weight:')],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Height:')],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Activity Level:')],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Goal:')],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Neck:')],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Waist:')],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Text('Hip:')],),
            ],
          ),
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