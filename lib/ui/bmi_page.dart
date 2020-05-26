import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
import 'package:flutterapp2/bloc/profile_event.dart';
import 'package:flutterapp2/bloc/profile_state.dart';
import 'package:flutterapp2/models/profile_model.dart';
import 'package:provider/provider.dart';

import '../data/moor_database.dart';
/*
import 'widget/new_task_input_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    Future<List<Profile>> myFuture;

    final database = Provider.of<AppDatabase>(context);

    @override
    initState() {
      super.initState();

      myFuture = database.getAllProfiles();
    }




    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildTaskList(context)),
            NewTaskInput(),
          ],
        ));
  }

  StreamBuilder<List<Profile>> _buildTaskList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllTasks(),
      builder: (context, AsyncSnapshot<List<Profile>> snapshot) {
        final tasks = snapshot.data ?? List();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Profile itemTask, AppDatabase database) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => database.deleteTask(itemTask),
        )
      ],
      child: CheckboxListTile(
        title: Text(itemTask.name),
        subtitle: Text(itemTask.dueDate?.toString() ?? 'No date'),
        value: itemTask.completed,
        onChanged: (newValue) {
          database.updateTask(itemTask.copyWith(completed: newValue));
        },
      ),
    );
  }
}
*/

class BmiPage extends StatelessWidget {
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

  double calculateBMI(int weight, int height) {
    return (703 * (weight / (height * height))).toDouble();
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
                  'BMI',
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
                calculateBMI(profileModel.profileAttributes[profileModel.profileAttributes.length - 1].weight, profileModel.profileAttributes[profileModel.profileAttributes.length - 1].height).toString(),
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


/*
  class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 50),
  child: TextField(
  onSubmitted: (value) => submitCityName(context, value),
  textInputAction: TextInputAction.search,
  decoration: InputDecoration(
  hintText: "Enter a city",
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  suffixIcon: Icon(Icons.search),
  ),
  ),
  );
  }


  }

*/



