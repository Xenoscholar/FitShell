import 'package:flutterapp2/profile.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'moor_database.g.dart';

// The name of the database table is "tasks"
// By default, the name of the generated data class will be "Task" (without "s")
class Profiles extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  BoolColumn get isMale => boolean()();
  IntColumn get age => integer()();
  IntColumn get weight => integer()();
  IntColumn get height => integer()();
// DateTime is not natively supported by SQLite
// Moor converts it to & from UNIX seconds
// Booleans are not supported as well, Moor converts them to integers
// Simple default values are specified as Constants

}


@UseMoor(tables: [Profiles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',
      logStatements: true));

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;


  // All tables have getters in the generated class - we can select the tasks table
  Future<List<Profile>> getAllProfiles() async {

    List<Profile> checkkk = await select(profiles).get();


    /*select(profiles).get();*/

    /*throw Error();*/



    if(checkkk.length == 0) {
      throw Error();
    } else {
      return select(profiles).get();
    }

   /* if(select(profiles).get() == null) {
      throw Error();*//*Future.error(Error());*//*
    } else {
      select(profiles).get();
    }

    switch(select(profiles).get()) {
      case null: {
        throw Error();
      }
      break;
      case isNotNull(): {

      }
    }

    FutureBuilde(
        future: select(profiles).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.data == null) {
            throw Error();
          } else {
            select(profiles).get();
          }
        }
    );*/
  }

  Future<Profile> getProfile() => select(profiles).getSingle();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Profile>> watchAllTasks() => select(profiles).watch();

  Future insertTask(Profile profile) => into(profiles).insert(profile);

  // Updates a Task with a matching primary key
  Future updateTask(Profile profile) => update(profiles).replace(profile);

  Future deleteTask(Profile profile) => delete(profiles).delete(profile);


}