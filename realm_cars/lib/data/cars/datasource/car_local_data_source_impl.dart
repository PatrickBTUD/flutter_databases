import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:realm_cars/data/cars/car_dto.dart';
import 'package:realm_cars/data/cars/datasource/car_local_data_source.dart';

final carProvider = Provider<CarLocalDataSource>((_) => CarLocalDataSourceImpl());

final carStreamProvider = StreamProvider((ref) => ref.watch(carProvider).watchCars());

class CarLocalDataSourceImpl extends CarLocalDataSource {
  // example config for inMemory DB
  //final inMemoryConfig = Configuration.inMemory([CarDto.schema]);

  final config = Configuration.local([CarDto.schema]);
  late Realm realm;

  CarLocalDataSourceImpl() {
    realm = Realm(config);
  }

  @override
  List<CarDto> getCars() {
    return realm.all<CarDto>().toList();
  }

  @override
  Stream<List<CarDto>> watchCars({SortBy? sortBy}) {
    if (sortBy != null) {
      final sort = sortBy.value;
      final result = realm.query<CarDto>('TRUEPREDICATE SORT($sort ASC)');
      return result.changes.map((event) => event.results.toList());
    }
    return realm.all<CarDto>().changes.map((event) => event.results.toList());
  }

  @override
  CarDto getHighestKilometers() {
    final result = realm.query<CarDto>(r'TRUEPREDICATE SORT(kilometers DESC) LIMIT(1)');
    return result.first;
  }

  @override
  CarDto getLowestKilometers() {
    final result = realm.query<CarDto>(r'TRUEPREDICATE SORT(kilometers ASC) LIMIT(1)');
    return result.first;
  }

  @override
  void addCar({
    required String make,
    required String model,
    required int kilometers,
    required DateTime registrationDate,
  }) {
    realm.write(() {
      realm.add(CarDto(
        make: make,
        model: model,
        kilometers: kilometers,
        registrationDate: registrationDate,
      ));
    });
  }

  @override
  void updateKilometers({
    required CarDto car,
    required int addKilometers,
  }) {
    realm.write(() {
      car.kilometers = (car.kilometers ?? 0) + addKilometers;
    });
  }
}
