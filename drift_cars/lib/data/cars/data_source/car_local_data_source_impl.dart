import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_cars/data/cars/car_dto.dart';
import 'package:drift_cars/domain/car.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'car_local_data_source.dart';

part 'car_local_data_source_impl.g.dart';

final carLocalDataSourceProvider = Provider((_) => CarLocalDataSourceImpl());

@DriftDatabase(tables: [CarDto])
class CarLocalDataSourceImpl extends _$CarLocalDataSourceImpl implements CarLocalDataSource {
  CarLocalDataSourceImpl() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  Future<void> addCar(Car car) {
    // TODO: implement addCar
    throw UnimplementedError();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    //for dev - delete db on every restart
    if (kDebugMode && await file.exists()) {
      await file.delete();
    }
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
