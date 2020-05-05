import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/bloc/profile_bloc.dart';
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

/*
class BmiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Results"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial) {
              return buildInitialInput();
            } else if (state is ProfileLoading) {
              return buildLoading();
            } else if (state is ProfileLoaded) {
              return buildColumnWithData(context, state.profileModel);
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
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }


  Column buildColumnWithData(BuildContext context, ProfileModel profileModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FutureBuilder(
          future: profileModel.profileAttributes,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Text(snapshot.data["age"].toString());

          },
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        RaisedButton(
          child: Text('See Details'),
          color: Colors.lightBlue[100],
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) =>
                    BlocProvider.value(
                      value: BlocProvider.of<WeatherBloc>(context),
                      child: WeatherDetailPage(
                        masterWeather: weather,
                      ),
                    ),
              ),
            );
          },
        ),
        CityInputField(),
      ],
    );
  }
}
*/


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


