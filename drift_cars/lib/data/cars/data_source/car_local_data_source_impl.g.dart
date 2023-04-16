// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_local_data_source_impl.dart';

// ignore_for_file: type=lint
class $CarDtoTable extends CarDto with TableInfo<$CarDtoTable, CarDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarDtoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _makeMeta = const VerificationMeta('make');
  @override
  late final GeneratedColumn<String> make = GeneratedColumn<String>(
      'make', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _registrationDateMeta =
      const VerificationMeta('registrationDate');
  @override
  late final GeneratedColumn<DateTime> registrationDate =
      GeneratedColumn<DateTime>('registration_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, make, model, registrationDate];
  @override
  String get aliasedName => _alias ?? 'car_dto';
  @override
  String get actualTableName => 'car_dto';
  @override
  VerificationContext validateIntegrity(Insertable<CarDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('make')) {
      context.handle(
          _makeMeta, make.isAcceptableOrUnknown(data['make']!, _makeMeta));
    } else if (isInserting) {
      context.missing(_makeMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('registration_date')) {
      context.handle(
          _registrationDateMeta,
          registrationDate.isAcceptableOrUnknown(
              data['registration_date']!, _registrationDateMeta));
    } else if (isInserting) {
      context.missing(_registrationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CarDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CarDtoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      make: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}make'])!,
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model'])!,
      registrationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}registration_date'])!,
    );
  }

  @override
  $CarDtoTable createAlias(String alias) {
    return $CarDtoTable(attachedDatabase, alias);
  }
}

class CarDtoData extends DataClass implements Insertable<CarDtoData> {
  final int id;
  final String make;
  final String model;
  final DateTime registrationDate;
  const CarDtoData(
      {required this.id,
      required this.make,
      required this.model,
      required this.registrationDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['make'] = Variable<String>(make);
    map['model'] = Variable<String>(model);
    map['registration_date'] = Variable<DateTime>(registrationDate);
    return map;
  }

  CarDtoCompanion toCompanion(bool nullToAbsent) {
    return CarDtoCompanion(
      id: Value(id),
      make: Value(make),
      model: Value(model),
      registrationDate: Value(registrationDate),
    );
  }

  factory CarDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CarDtoData(
      id: serializer.fromJson<int>(json['id']),
      make: serializer.fromJson<String>(json['make']),
      model: serializer.fromJson<String>(json['model']),
      registrationDate: serializer.fromJson<DateTime>(json['registrationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'make': serializer.toJson<String>(make),
      'model': serializer.toJson<String>(model),
      'registrationDate': serializer.toJson<DateTime>(registrationDate),
    };
  }

  CarDtoData copyWith(
          {int? id, String? make, String? model, DateTime? registrationDate}) =>
      CarDtoData(
        id: id ?? this.id,
        make: make ?? this.make,
        model: model ?? this.model,
        registrationDate: registrationDate ?? this.registrationDate,
      );
  @override
  String toString() {
    return (StringBuffer('CarDtoData(')
          ..write('id: $id, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('registrationDate: $registrationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, make, model, registrationDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarDtoData &&
          other.id == this.id &&
          other.make == this.make &&
          other.model == this.model &&
          other.registrationDate == this.registrationDate);
}

class CarDtoCompanion extends UpdateCompanion<CarDtoData> {
  final Value<int> id;
  final Value<String> make;
  final Value<String> model;
  final Value<DateTime> registrationDate;
  const CarDtoCompanion({
    this.id = const Value.absent(),
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.registrationDate = const Value.absent(),
  });
  CarDtoCompanion.insert({
    this.id = const Value.absent(),
    required String make,
    required String model,
    required DateTime registrationDate,
  })  : make = Value(make),
        model = Value(model),
        registrationDate = Value(registrationDate);
  static Insertable<CarDtoData> custom({
    Expression<int>? id,
    Expression<String>? make,
    Expression<String>? model,
    Expression<DateTime>? registrationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (make != null) 'make': make,
      if (model != null) 'model': model,
      if (registrationDate != null) 'registration_date': registrationDate,
    });
  }

  CarDtoCompanion copyWith(
      {Value<int>? id,
      Value<String>? make,
      Value<String>? model,
      Value<DateTime>? registrationDate}) {
    return CarDtoCompanion(
      id: id ?? this.id,
      make: make ?? this.make,
      model: model ?? this.model,
      registrationDate: registrationDate ?? this.registrationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (make.present) {
      map['make'] = Variable<String>(make.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (registrationDate.present) {
      map['registration_date'] = Variable<DateTime>(registrationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarDtoCompanion(')
          ..write('id: $id, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('registrationDate: $registrationDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$CarLocalDataSourceImpl extends GeneratedDatabase {
  _$CarLocalDataSourceImpl(QueryExecutor e) : super(e);
  late final $CarDtoTable carDto = $CarDtoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [carDto];
}
