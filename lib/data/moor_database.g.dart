// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Profile extends DataClass implements Insertable<Profile> {
  final int id;
  final bool isMale;
  final int age;
  final double weight;
  final double height;
  final int activity;
  final int goal;
  final double neck;
  final double waist;
  final double hip;
  final bool isMetric;
  Profile(
      {@required this.id,
      @required this.isMale,
      @required this.age,
      @required this.weight,
      @required this.height,
      @required this.activity,
      @required this.goal,
      this.neck,
      this.waist,
      this.hip,
      @required this.isMetric});
  factory Profile.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Profile(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      isMale:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_male']),
      age: intType.mapFromDatabaseResponse(data['${effectivePrefix}age']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      height:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}height']),
      activity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}activity']),
      goal: intType.mapFromDatabaseResponse(data['${effectivePrefix}goal']),
      neck: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}neck']),
      waist:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}waist']),
      hip: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}hip']),
      isMetric:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_metric']),
    );
  }
  factory Profile.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      isMale: serializer.fromJson<bool>(json['isMale']),
      age: serializer.fromJson<int>(json['age']),
      weight: serializer.fromJson<double>(json['weight']),
      height: serializer.fromJson<double>(json['height']),
      activity: serializer.fromJson<int>(json['activity']),
      goal: serializer.fromJson<int>(json['goal']),
      neck: serializer.fromJson<double>(json['neck']),
      waist: serializer.fromJson<double>(json['waist']),
      hip: serializer.fromJson<double>(json['hip']),
      isMetric: serializer.fromJson<bool>(json['isMetric']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'isMale': serializer.toJson<bool>(isMale),
      'age': serializer.toJson<int>(age),
      'weight': serializer.toJson<double>(weight),
      'height': serializer.toJson<double>(height),
      'activity': serializer.toJson<int>(activity),
      'goal': serializer.toJson<int>(goal),
      'neck': serializer.toJson<double>(neck),
      'waist': serializer.toJson<double>(waist),
      'hip': serializer.toJson<double>(hip),
      'isMetric': serializer.toJson<bool>(isMetric),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Profile>>(bool nullToAbsent) {
    return ProfilesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      isMale:
          isMale == null && nullToAbsent ? const Value.absent() : Value(isMale),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      activity: activity == null && nullToAbsent
          ? const Value.absent()
          : Value(activity),
      goal: goal == null && nullToAbsent ? const Value.absent() : Value(goal),
      neck: neck == null && nullToAbsent ? const Value.absent() : Value(neck),
      waist:
          waist == null && nullToAbsent ? const Value.absent() : Value(waist),
      hip: hip == null && nullToAbsent ? const Value.absent() : Value(hip),
      isMetric: isMetric == null && nullToAbsent
          ? const Value.absent()
          : Value(isMetric),
    ) as T;
  }

  Profile copyWith(
          {int id,
          bool isMale,
          int age,
          double weight,
          double height,
          int activity,
          int goal,
          double neck,
          double waist,
          double hip,
          bool isMetric}) =>
      Profile(
        id: id ?? this.id,
        isMale: isMale ?? this.isMale,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        activity: activity ?? this.activity,
        goal: goal ?? this.goal,
        neck: neck ?? this.neck,
        waist: waist ?? this.waist,
        hip: hip ?? this.hip,
        isMetric: isMetric ?? this.isMetric,
      );
  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('isMale: $isMale, ')
          ..write('age: $age, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('activity: $activity, ')
          ..write('goal: $goal, ')
          ..write('neck: $neck, ')
          ..write('waist: $waist, ')
          ..write('hip: $hip, ')
          ..write('isMetric: $isMetric')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          isMale.hashCode,
          $mrjc(
              age.hashCode,
              $mrjc(
                  weight.hashCode,
                  $mrjc(
                      height.hashCode,
                      $mrjc(
                          activity.hashCode,
                          $mrjc(
                              goal.hashCode,
                              $mrjc(
                                  neck.hashCode,
                                  $mrjc(
                                      waist.hashCode,
                                      $mrjc(hip.hashCode,
                                          isMetric.hashCode)))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == id &&
          other.isMale == isMale &&
          other.age == age &&
          other.weight == weight &&
          other.height == height &&
          other.activity == activity &&
          other.goal == goal &&
          other.neck == neck &&
          other.waist == waist &&
          other.hip == hip &&
          other.isMetric == isMetric);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<bool> isMale;
  final Value<int> age;
  final Value<double> weight;
  final Value<double> height;
  final Value<int> activity;
  final Value<int> goal;
  final Value<double> neck;
  final Value<double> waist;
  final Value<double> hip;
  final Value<bool> isMetric;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.isMale = const Value.absent(),
    this.age = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.activity = const Value.absent(),
    this.goal = const Value.absent(),
    this.neck = const Value.absent(),
    this.waist = const Value.absent(),
    this.hip = const Value.absent(),
    this.isMetric = const Value.absent(),
  });
  ProfilesCompanion copyWith(
      {Value<int> id,
      Value<bool> isMale,
      Value<int> age,
      Value<double> weight,
      Value<double> height,
      Value<int> activity,
      Value<int> goal,
      Value<double> neck,
      Value<double> waist,
      Value<double> hip,
      Value<bool> isMetric}) {
    return ProfilesCompanion(
      id: id ?? this.id,
      isMale: isMale ?? this.isMale,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      activity: activity ?? this.activity,
      goal: goal ?? this.goal,
      neck: neck ?? this.neck,
      waist: waist ?? this.waist,
      hip: hip ?? this.hip,
      isMetric: isMetric ?? this.isMetric,
    );
  }
}

class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProfilesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _isMaleMeta = const VerificationMeta('isMale');
  GeneratedBoolColumn _isMale;
  @override
  GeneratedBoolColumn get isMale => _isMale ??= _constructIsMale();
  GeneratedBoolColumn _constructIsMale() {
    return GeneratedBoolColumn(
      'is_male',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ageMeta = const VerificationMeta('age');
  GeneratedIntColumn _age;
  @override
  GeneratedIntColumn get age => _age ??= _constructAge();
  GeneratedIntColumn _constructAge() {
    return GeneratedIntColumn(
      'age',
      $tableName,
      false,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedRealColumn _weight;
  @override
  GeneratedRealColumn get weight => _weight ??= _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _heightMeta = const VerificationMeta('height');
  GeneratedRealColumn _height;
  @override
  GeneratedRealColumn get height => _height ??= _constructHeight();
  GeneratedRealColumn _constructHeight() {
    return GeneratedRealColumn(
      'height',
      $tableName,
      false,
    );
  }

  final VerificationMeta _activityMeta = const VerificationMeta('activity');
  GeneratedIntColumn _activity;
  @override
  GeneratedIntColumn get activity => _activity ??= _constructActivity();
  GeneratedIntColumn _constructActivity() {
    return GeneratedIntColumn(
      'activity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _goalMeta = const VerificationMeta('goal');
  GeneratedIntColumn _goal;
  @override
  GeneratedIntColumn get goal => _goal ??= _constructGoal();
  GeneratedIntColumn _constructGoal() {
    return GeneratedIntColumn(
      'goal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _neckMeta = const VerificationMeta('neck');
  GeneratedRealColumn _neck;
  @override
  GeneratedRealColumn get neck => _neck ??= _constructNeck();
  GeneratedRealColumn _constructNeck() {
    return GeneratedRealColumn(
      'neck',
      $tableName,
      true,
    );
  }

  final VerificationMeta _waistMeta = const VerificationMeta('waist');
  GeneratedRealColumn _waist;
  @override
  GeneratedRealColumn get waist => _waist ??= _constructWaist();
  GeneratedRealColumn _constructWaist() {
    return GeneratedRealColumn(
      'waist',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hipMeta = const VerificationMeta('hip');
  GeneratedRealColumn _hip;
  @override
  GeneratedRealColumn get hip => _hip ??= _constructHip();
  GeneratedRealColumn _constructHip() {
    return GeneratedRealColumn(
      'hip',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isMetricMeta = const VerificationMeta('isMetric');
  GeneratedBoolColumn _isMetric;
  @override
  GeneratedBoolColumn get isMetric => _isMetric ??= _constructIsMetric();
  GeneratedBoolColumn _constructIsMetric() {
    return GeneratedBoolColumn(
      'is_metric',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        isMale,
        age,
        weight,
        height,
        activity,
        goal,
        neck,
        waist,
        hip,
        isMetric
      ];
  @override
  $ProfilesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'profiles';
  @override
  final String actualTableName = 'profiles';
  @override
  VerificationContext validateIntegrity(ProfilesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.isMale.present) {
      context.handle(
          _isMaleMeta, isMale.isAcceptableValue(d.isMale.value, _isMaleMeta));
    } else if (isMale.isRequired && isInserting) {
      context.missing(_isMaleMeta);
    }
    if (d.age.present) {
      context.handle(_ageMeta, age.isAcceptableValue(d.age.value, _ageMeta));
    } else if (age.isRequired && isInserting) {
      context.missing(_ageMeta);
    }
    if (d.weight.present) {
      context.handle(
          _weightMeta, weight.isAcceptableValue(d.weight.value, _weightMeta));
    } else if (weight.isRequired && isInserting) {
      context.missing(_weightMeta);
    }
    if (d.height.present) {
      context.handle(
          _heightMeta, height.isAcceptableValue(d.height.value, _heightMeta));
    } else if (height.isRequired && isInserting) {
      context.missing(_heightMeta);
    }
    if (d.activity.present) {
      context.handle(_activityMeta,
          activity.isAcceptableValue(d.activity.value, _activityMeta));
    } else if (activity.isRequired && isInserting) {
      context.missing(_activityMeta);
    }
    if (d.goal.present) {
      context.handle(
          _goalMeta, goal.isAcceptableValue(d.goal.value, _goalMeta));
    } else if (goal.isRequired && isInserting) {
      context.missing(_goalMeta);
    }
    if (d.neck.present) {
      context.handle(
          _neckMeta, neck.isAcceptableValue(d.neck.value, _neckMeta));
    } else if (neck.isRequired && isInserting) {
      context.missing(_neckMeta);
    }
    if (d.waist.present) {
      context.handle(
          _waistMeta, waist.isAcceptableValue(d.waist.value, _waistMeta));
    } else if (waist.isRequired && isInserting) {
      context.missing(_waistMeta);
    }
    if (d.hip.present) {
      context.handle(_hipMeta, hip.isAcceptableValue(d.hip.value, _hipMeta));
    } else if (hip.isRequired && isInserting) {
      context.missing(_hipMeta);
    }
    if (d.isMetric.present) {
      context.handle(_isMetricMeta,
          isMetric.isAcceptableValue(d.isMetric.value, _isMetricMeta));
    } else if (isMetric.isRequired && isInserting) {
      context.missing(_isMetricMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Profile.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ProfilesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.isMale.present) {
      map['is_male'] = Variable<bool, BoolType>(d.isMale.value);
    }
    if (d.age.present) {
      map['age'] = Variable<int, IntType>(d.age.value);
    }
    if (d.weight.present) {
      map['weight'] = Variable<double, RealType>(d.weight.value);
    }
    if (d.height.present) {
      map['height'] = Variable<double, RealType>(d.height.value);
    }
    if (d.activity.present) {
      map['activity'] = Variable<int, IntType>(d.activity.value);
    }
    if (d.goal.present) {
      map['goal'] = Variable<int, IntType>(d.goal.value);
    }
    if (d.neck.present) {
      map['neck'] = Variable<double, RealType>(d.neck.value);
    }
    if (d.waist.present) {
      map['waist'] = Variable<double, RealType>(d.waist.value);
    }
    if (d.hip.present) {
      map['hip'] = Variable<double, RealType>(d.hip.value);
    }
    if (d.isMetric.present) {
      map['is_metric'] = Variable<bool, BoolType>(d.isMetric.value);
    }
    return map;
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(_db, alias);
  }
}

class BmiData extends DataClass implements Insertable<BmiData> {
  final int id;
  final double bmi;
  final DateTime date;
  BmiData({@required this.id, @required this.bmi, @required this.date});
  factory BmiData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return BmiData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      bmi: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}bmi']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  factory BmiData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return BmiData(
      id: serializer.fromJson<int>(json['id']),
      bmi: serializer.fromJson<double>(json['bmi']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'bmi': serializer.toJson<double>(bmi),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<BmiData>>(bool nullToAbsent) {
    return BmiCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      bmi: bmi == null && nullToAbsent ? const Value.absent() : Value(bmi),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    ) as T;
  }

  BmiData copyWith({int id, double bmi, DateTime date}) => BmiData(
        id: id ?? this.id,
        bmi: bmi ?? this.bmi,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('BmiData(')
          ..write('id: $id, ')
          ..write('bmi: $bmi, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(bmi.hashCode, date.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is BmiData &&
          other.id == id &&
          other.bmi == bmi &&
          other.date == date);
}

class BmiCompanion extends UpdateCompanion<BmiData> {
  final Value<int> id;
  final Value<double> bmi;
  final Value<DateTime> date;
  const BmiCompanion({
    this.id = const Value.absent(),
    this.bmi = const Value.absent(),
    this.date = const Value.absent(),
  });
  BmiCompanion copyWith(
      {Value<int> id, Value<double> bmi, Value<DateTime> date}) {
    return BmiCompanion(
      id: id ?? this.id,
      bmi: bmi ?? this.bmi,
      date: date ?? this.date,
    );
  }
}

class $BmiTable extends Bmi with TableInfo<$BmiTable, BmiData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BmiTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _bmiMeta = const VerificationMeta('bmi');
  GeneratedRealColumn _bmi;
  @override
  GeneratedRealColumn get bmi => _bmi ??= _constructBmi();
  GeneratedRealColumn _constructBmi() {
    return GeneratedRealColumn(
      'bmi',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, bmi, date];
  @override
  $BmiTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bmi';
  @override
  final String actualTableName = 'bmi';
  @override
  VerificationContext validateIntegrity(BmiCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.bmi.present) {
      context.handle(_bmiMeta, bmi.isAcceptableValue(d.bmi.value, _bmiMeta));
    } else if (bmi.isRequired && isInserting) {
      context.missing(_bmiMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BmiData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BmiData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BmiCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.bmi.present) {
      map['bmi'] = Variable<double, RealType>(d.bmi.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    return map;
  }

  @override
  $BmiTable createAlias(String alias) {
    return $BmiTable(_db, alias);
  }
}

class BodyFatData extends DataClass implements Insertable<BodyFatData> {
  final int id;
  final double bodyFat;
  final DateTime date;
  BodyFatData({@required this.id, @required this.bodyFat, @required this.date});
  factory BodyFatData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return BodyFatData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      bodyFat: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}body_fat']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  factory BodyFatData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return BodyFatData(
      id: serializer.fromJson<int>(json['id']),
      bodyFat: serializer.fromJson<double>(json['bodyFat']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'bodyFat': serializer.toJson<double>(bodyFat),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<BodyFatData>>(bool nullToAbsent) {
    return BodyFatCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      bodyFat: bodyFat == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFat),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    ) as T;
  }

  BodyFatData copyWith({int id, double bodyFat, DateTime date}) => BodyFatData(
        id: id ?? this.id,
        bodyFat: bodyFat ?? this.bodyFat,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('BodyFatData(')
          ..write('id: $id, ')
          ..write('bodyFat: $bodyFat, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(bodyFat.hashCode, date.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is BodyFatData &&
          other.id == id &&
          other.bodyFat == bodyFat &&
          other.date == date);
}

class BodyFatCompanion extends UpdateCompanion<BodyFatData> {
  final Value<int> id;
  final Value<double> bodyFat;
  final Value<DateTime> date;
  const BodyFatCompanion({
    this.id = const Value.absent(),
    this.bodyFat = const Value.absent(),
    this.date = const Value.absent(),
  });
  BodyFatCompanion copyWith(
      {Value<int> id, Value<double> bodyFat, Value<DateTime> date}) {
    return BodyFatCompanion(
      id: id ?? this.id,
      bodyFat: bodyFat ?? this.bodyFat,
      date: date ?? this.date,
    );
  }
}

class $BodyFatTable extends BodyFat with TableInfo<$BodyFatTable, BodyFatData> {
  final GeneratedDatabase _db;
  final String _alias;
  $BodyFatTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _bodyFatMeta = const VerificationMeta('bodyFat');
  GeneratedRealColumn _bodyFat;
  @override
  GeneratedRealColumn get bodyFat => _bodyFat ??= _constructBodyFat();
  GeneratedRealColumn _constructBodyFat() {
    return GeneratedRealColumn(
      'body_fat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, bodyFat, date];
  @override
  $BodyFatTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'body_fat';
  @override
  final String actualTableName = 'body_fat';
  @override
  VerificationContext validateIntegrity(BodyFatCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.bodyFat.present) {
      context.handle(_bodyFatMeta,
          bodyFat.isAcceptableValue(d.bodyFat.value, _bodyFatMeta));
    } else if (bodyFat.isRequired && isInserting) {
      context.missing(_bodyFatMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyFatData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BodyFatData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BodyFatCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.bodyFat.present) {
      map['body_fat'] = Variable<double, RealType>(d.bodyFat.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    return map;
  }

  @override
  $BodyFatTable createAlias(String alias) {
    return $BodyFatTable(_db, alias);
  }
}

class LeanBodyData extends DataClass implements Insertable<LeanBodyData> {
  final int id;
  final double leanBody;
  final DateTime date;
  LeanBodyData(
      {@required this.id, @required this.leanBody, @required this.date});
  factory LeanBodyData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return LeanBodyData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      leanBody: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}lean_body']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  factory LeanBodyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return LeanBodyData(
      id: serializer.fromJson<int>(json['id']),
      leanBody: serializer.fromJson<double>(json['leanBody']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'leanBody': serializer.toJson<double>(leanBody),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<LeanBodyData>>(
      bool nullToAbsent) {
    return LeanBodyCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      leanBody: leanBody == null && nullToAbsent
          ? const Value.absent()
          : Value(leanBody),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    ) as T;
  }

  LeanBodyData copyWith({int id, double leanBody, DateTime date}) =>
      LeanBodyData(
        id: id ?? this.id,
        leanBody: leanBody ?? this.leanBody,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('LeanBodyData(')
          ..write('id: $id, ')
          ..write('leanBody: $leanBody, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(leanBody.hashCode, date.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is LeanBodyData &&
          other.id == id &&
          other.leanBody == leanBody &&
          other.date == date);
}

class LeanBodyCompanion extends UpdateCompanion<LeanBodyData> {
  final Value<int> id;
  final Value<double> leanBody;
  final Value<DateTime> date;
  const LeanBodyCompanion({
    this.id = const Value.absent(),
    this.leanBody = const Value.absent(),
    this.date = const Value.absent(),
  });
  LeanBodyCompanion copyWith(
      {Value<int> id, Value<double> leanBody, Value<DateTime> date}) {
    return LeanBodyCompanion(
      id: id ?? this.id,
      leanBody: leanBody ?? this.leanBody,
      date: date ?? this.date,
    );
  }
}

class $LeanBodyTable extends LeanBody
    with TableInfo<$LeanBodyTable, LeanBodyData> {
  final GeneratedDatabase _db;
  final String _alias;
  $LeanBodyTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _leanBodyMeta = const VerificationMeta('leanBody');
  GeneratedRealColumn _leanBody;
  @override
  GeneratedRealColumn get leanBody => _leanBody ??= _constructLeanBody();
  GeneratedRealColumn _constructLeanBody() {
    return GeneratedRealColumn(
      'lean_body',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, leanBody, date];
  @override
  $LeanBodyTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'lean_body';
  @override
  final String actualTableName = 'lean_body';
  @override
  VerificationContext validateIntegrity(LeanBodyCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.leanBody.present) {
      context.handle(_leanBodyMeta,
          leanBody.isAcceptableValue(d.leanBody.value, _leanBodyMeta));
    } else if (leanBody.isRequired && isInserting) {
      context.missing(_leanBodyMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LeanBodyData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LeanBodyData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(LeanBodyCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.leanBody.present) {
      map['lean_body'] = Variable<double, RealType>(d.leanBody.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    return map;
  }

  @override
  $LeanBodyTable createAlias(String alias) {
    return $LeanBodyTable(_db, alias);
  }
}

class WeightData extends DataClass implements Insertable<WeightData> {
  final int id;
  final double weight;
  final DateTime date;
  WeightData({@required this.id, @required this.weight, @required this.date});
  factory WeightData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return WeightData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  factory WeightData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return WeightData(
      id: serializer.fromJson<int>(json['id']),
      weight: serializer.fromJson<double>(json['weight']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'weight': serializer.toJson<double>(weight),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<WeightData>>(bool nullToAbsent) {
    return WeightCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    ) as T;
  }

  WeightData copyWith({int id, double weight, DateTime date}) => WeightData(
        id: id ?? this.id,
        weight: weight ?? this.weight,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('WeightData(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(weight.hashCode, date.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is WeightData &&
          other.id == id &&
          other.weight == weight &&
          other.date == date);
}

class WeightCompanion extends UpdateCompanion<WeightData> {
  final Value<int> id;
  final Value<double> weight;
  final Value<DateTime> date;
  const WeightCompanion({
    this.id = const Value.absent(),
    this.weight = const Value.absent(),
    this.date = const Value.absent(),
  });
  WeightCompanion copyWith(
      {Value<int> id, Value<double> weight, Value<DateTime> date}) {
    return WeightCompanion(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      date: date ?? this.date,
    );
  }
}

class $WeightTable extends Weight with TableInfo<$WeightTable, WeightData> {
  final GeneratedDatabase _db;
  final String _alias;
  $WeightTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedRealColumn _weight;
  @override
  GeneratedRealColumn get weight => _weight ??= _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, weight, date];
  @override
  $WeightTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'weight';
  @override
  final String actualTableName = 'weight';
  @override
  VerificationContext validateIntegrity(WeightCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.weight.present) {
      context.handle(
          _weightMeta, weight.isAcceptableValue(d.weight.value, _weightMeta));
    } else if (weight.isRequired && isInserting) {
      context.missing(_weightMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeightData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WeightData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(WeightCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.weight.present) {
      map['weight'] = Variable<double, RealType>(d.weight.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    return map;
  }

  @override
  $WeightTable createAlias(String alias) {
    return $WeightTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $ProfilesTable _profiles;
  $ProfilesTable get profiles => _profiles ??= $ProfilesTable(this);
  $BmiTable _bmi;
  $BmiTable get bmi => _bmi ??= $BmiTable(this);
  $BodyFatTable _bodyFat;
  $BodyFatTable get bodyFat => _bodyFat ??= $BodyFatTable(this);
  $LeanBodyTable _leanBody;
  $LeanBodyTable get leanBody => _leanBody ??= $LeanBodyTable(this);
  $WeightTable _weight;
  $WeightTable get weight => _weight ??= $WeightTable(this);
  CalculationsDao _calculationsDao;
  CalculationsDao get calculationsDao =>
      _calculationsDao ??= CalculationsDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [profiles, bmi, bodyFat, leanBody, weight];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$CalculationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $BmiTable get bmi => db.bmi;
  $BodyFatTable get bodyFat => db.bodyFat;
  $LeanBodyTable get leanBody => db.leanBody;
  $WeightTable get weight => db.weight;
}
