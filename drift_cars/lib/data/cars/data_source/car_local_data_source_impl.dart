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

final getCarsProvider = FutureProvider<List<CarDtoData>>((ref) {
  return ref.read(carLocalDataSourceProvider).getCars();
});

final carsStreamProvider = StreamProvider((ref) => ref.read(carLocalDataSourceProvider).carsStream);

@DriftDatabase(tables: [CarDto])
class CarLocalDataSourceImpl extends _$CarLocalDataSourceImpl implements CarLocalDataSource {
  CarLocalDataSourceImpl() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  Future<void> addCar(Car car) async {
    await into(carDto).insert(
      CarDtoCompanion.insert(
        make: car.make,
        model: car.model,
        kilometers: car.kilometers,
        registrationDate: car.registrationDate,
      ),
    );
  }

  @override
  Future<List<CarDtoData>> getCars() => select(carDto).get();

  @override
  Stream<List<CarDtoData>> get carsStream => select(carDto).watch();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    //TODO: remove again in production - for dev only - delete db on every restart
    if (kDebugMode && await file.exists()) {
      //await file.delete();
    }
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
