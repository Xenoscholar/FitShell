import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final myController1 = TextEditingController();
    final myController2 = TextEditingController();
    final myController3 = TextEditingController();


    /*final AppDatabase database = Provider.of<AppDatabase>(context);
    final ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);*/

    @override
    void dispose(TextEditingController myController1, TextEditingController myController2, TextEditingController myController3) {
      // Clean up the controller when the widget is disposed.
      myController1.dispose();
      myController2.dispose();
      myController3.dispose();
      super.dispose();
    }

    void putIntoo(AppDatabase database, TextEditingController controller1, TextEditingController controller2, TextEditingController controller3 ) {
      database.insertTask(Profile(id: null, isMale: true, age: int.parse(controller1.text), weight: int.parse(controller2.text), height: int.parse(controller3.text)));
      /*dispose(controller1, controller2, controller3);*/

    }

    /*@override
    initState() {
      super.initState();


    }*/



    return Scaffold(
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
        /*  BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {

              }
          ),*/
          Center(
              /*padding: EdgeInsets.all(20),*/
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
                  color: Colors.blue,
                ),
              Spacer(),
          RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bmi()),
                );
              },
            color: Colors.yellow,
          ),
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
              /*padding: EdgeInsets.all(20),*/
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


}
