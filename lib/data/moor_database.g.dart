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
  final int weight;
  final int height;
  Profile(
      {@required this.id,
      @required this.isMale,
      @required this.age,
      @required this.weight,
      @required this.height});
  factory Profile.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Profile(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      isMale:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_male']),
      age: intType.mapFromDatabaseResponse(data['${effectivePrefix}age']),
      weight: intType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      height: intType.mapFromDatabaseResponse(data['${effectivePrefix}height']),
    );
  }
  factory Profile.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      isMale: serializer.fromJson<bool>(json['isMale']),
      age: serializer.fromJson<int>(json['age']),
      weight: serializer.fromJson<int>(json['weight']),
      height: serializer.fromJson<int>(json['height']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'isMale': serializer.toJson<bool>(isMale),
      'age': serializer.toJson<int>(age),
      'weight': serializer.toJson<int>(weight),
      'height': serializer.toJson<int>(height),
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
    ) as T;
  }

  Profile copyWith({int id, bool isMale, int age, int weight, int height}) =>
      Profile(
        id: id ?? this.id,
        isMale: isMale ?? this.isMale,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
      );
  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('isMale: $isMale, ')
          ..write('age: $age, ')
          ..write('weight: $weight, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(isMale.hashCode,
          $mrjc(age.hashCode, $mrjc(weight.hashCode, height.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == id &&
          other.isMale == isMale &&
          other.age == age &&
          other.weight == weight &&
          other.height == height);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<bool> isMale;
  final Value<int> age;
  final Value<int> weight;
  final Value<int> height;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.isMale = const Value.absent(),
    this.age = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
  });
  ProfilesCompanion copyWith(
      {Value<int> id,
      Value<bool> isMale,
      Value<int> age,
      Value<int> weight,
      Value<int> height}) {
    return ProfilesCompanion(
      id: id ?? this.id,
      isMale: isMale ?? this.isMale,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
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
  GeneratedIntColumn _weight;
  @override
  GeneratedIntColumn get weight => _weight ??= _constructWeight();
  GeneratedIntColumn _constructWeight() {
    return GeneratedIntColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _heightMeta = const VerificationMeta('height');
  GeneratedIntColumn _height;
  @override
  GeneratedIntColumn get height => _height ??= _constructHeight();
  GeneratedIntColumn _constructHeight() {
    return GeneratedIntColumn(
      'height',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, isMale, age, weight, height];
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
      map['weight'] = Variable<int, IntType>(d.weight.value);
    }
    if (d.height.present) {
      map['height'] = Variable<int, IntType>(d.height.value);
    }
    return map;
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $ProfilesTable _profiles;
  $ProfilesTable get profiles => _profiles ??= $ProfilesTable(this);
  @override
  List<TableInfo> get allTables => [profiles];
}
