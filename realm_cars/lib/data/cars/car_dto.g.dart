// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_dto.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class CarDto extends _CarDto with RealmEntity, RealmObjectBase, RealmObject {
  CarDto({
    String? make,
    String? model,
    int? kilometers,
    DateTime? registrationDate,
  }) {
    RealmObjectBase.set(this, 'make', make);
    RealmObjectBase.set(this, 'model', model);
    RealmObjectBase.set(this, 'kilometers', kilometers);
    RealmObjectBase.set(this, 'registrationDate', registrationDate);
  }

  CarDto._();

  @override
  String? get make => RealmObjectBase.get<String>(this, 'make') as String?;
  @override
  set make(String? value) => RealmObjectBase.set(this, 'make', value);

  @override
  String? get model => RealmObjectBase.get<String>(this, 'model') as String?;
  @override
  set model(String? value) => RealmObjectBase.set(this, 'model', value);

  @override
  int? get kilometers => RealmObjectBase.get<int>(this, 'kilometers') as int?;
  @override
  set kilometers(int? value) => RealmObjectBase.set(this, 'kilometers', value);

  @override
  DateTime? get registrationDate =>
      RealmObjectBase.get<DateTime>(this, 'registrationDate') as DateTime?;
  @override
  set registrationDate(DateTime? value) =>
      RealmObjectBase.set(this, 'registrationDate', value);

  @override
  Stream<RealmObjectChanges<CarDto>> get changes =>
      RealmObjectBase.getChanges<CarDto>(this);

  @override
  CarDto freeze() => RealmObjectBase.freezeObject<CarDto>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CarDto._);
    return const SchemaObject(ObjectType.realmObject, CarDto, 'CarDto', [
      SchemaProperty('make', RealmPropertyType.string, optional: true),
      SchemaProperty('model', RealmPropertyType.string, optional: true),
      SchemaProperty('kilometers', RealmPropertyType.int, optional: true),
      SchemaProperty('registrationDate', RealmPropertyType.timestamp,
          optional: true),
    ]);
  }
}
