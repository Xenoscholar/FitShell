import 'package:flutterapp2/bmi.dart';
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
  RealColumn get weight => real()();
  RealColumn get height => real()();

  IntColumn get activity => integer()();
  IntColumn get goal => integer()();
  RealColumn get neck => real().nullable()();
  RealColumn get waist => real().nullable()();
  RealColumn get hip => real().nullable()();
  BoolColumn get isMetric => boolean()();
// DateTime is not natively supported by SQLite
// Moor converts it to & from UNIX seconds
// Booleans are not supported as well, Moor converts them to integers
// Simple default values are specified as Constants

}

class Bmi extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get bmi => real()();
  DateTimeColumn get date => dateTime()();
}

class BodyFat extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get bodyFat => real()();
  DateTimeColumn get date => dateTime()();
}

class LeanBody extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get leanBody => real()();
  DateTimeColumn get date => dateTime()();
}

class Weight extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get weight => real()();
  DateTimeColumn get date => dateTime()();
}


@UseDao(tables: [Bmi,BodyFat,LeanBody,Weight])
class CalculationsDao extends DatabaseAccessor<AppDatabase> with _$CalculationsDaoMixin {
  final AppDatabase db;

  CalculationsDao(this.db) : super(db);

  Stream<List<BmiData>> watchTags() => select(bmi).watch();
  /*Future insertTag(Insertable<BmiData> bmii) => into(bmi).insert(bmii);*/
  Future insertBmi(BmiData bmii) => into(bmi).insert(bmii);
  Future<List<BmiData>> getAllBmi() async {

    List<BmiData> checkkk = await select(bmi).get();

    if(checkkk.length == 0) {
      throw Error();
    } else {
      return select(bmi).get();
    }

  }

  Stream<List<BodyFatData>> watchBodyFat() => select(bodyFat).watch();
  /*Future insertTag(Insertable<Tag> tag) => into(tags).insert(tag);*/
  Future insertBodyFat(BodyFatData bodyfat) => into(bodyFat).insert(bodyfat);
  Future<List<BodyFatData>> getAllBodyFat() async {

    List<BodyFatData> checkkk = await select(bodyFat).get();

    if(checkkk.length == 0) {
      throw Error();
    } else {
      return select(bodyFat).get();
    }

  }

  Stream<List<LeanBodyData>> watchLeanBody() => select(leanBody).watch();
  /*Future insertTag(Insertable<Tag> tag) => into(tags).insert(tag);*/
  Future insertLeanBody(LeanBodyData leanBodyData) => into(leanBody).insert(leanBodyData);
  Future<List<LeanBodyData>> getAllLeanBody() async {

    List<LeanBodyData> checkkk = await select(leanBody).get();

    if(checkkk.length == 0) {
      throw Error();
    } else {
      return select(leanBody).get();
    }

  }

  Stream<List<WeightData>> watchWeight() => select(weight).watch();
  /*Future insertTag(Insertable<Tag> tag) => into(tags).insert(tag);*/
  Future insertWeight(WeightData weightt) => into(weight).insert(weightt);
  Future<List<WeightData>> getAllProfiles() async {

    List<WeightData> checkkk = await select(weight).get();

    if(checkkk.length == 0) {
      throw Error();
    } else {
      return select(weight).get();
    }

  }

}



@UseMoor(tables: [Profiles,Bmi,BodyFat,LeanBody,Weight], daos: [CalculationsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite',
      logStatements: true));

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from == 1) {
        await migrator.addColumn(profiles, profiles.activity);
        await migrator.addColumn(profiles, profiles.goal);
        await migrator.addColumn(profiles, profiles.neck);
        await migrator.addColumn(profiles, profiles.waist);
        await migrator.addColumn(profiles, profiles.hip);
        await migrator.addColumn(profiles, profiles.isMetric);
        await migrator.createAllTables();
      }
    },
    beforeOpen: (db, details) async {
      await db.customStatement('PRAGMA foreign_keys = ON');
    },
  );


  // All tables have getters in the generated class - we can select the tasks table
  Future<List<Profile>> getAllProfiles() async {

    List<Profile> checkkk = await select(profiles).get();

    if(checkkk.length == 0) {
      throw Error();
    } else {
      return select(profiles).get();
    }

  }

  Future<Profile> getProfile() => select(profiles).getSingle();
  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Profile>> watchAllTasks() => select(profiles).watch();

  Future insertTask(Profile profile) => into(profiles).insert(profile);
  // Updates a Task with a matching primary key
  Future updateTask(Profile profile) => update(profiles).replace(profile);

  Future deleteTask(Profile profile) => delete(profiles).delete(profile);

}