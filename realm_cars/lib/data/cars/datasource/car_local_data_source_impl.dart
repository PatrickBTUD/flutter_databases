import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:realm_cars/data/cars/car_dto.dart';
import 'package:realm_cars/data/cars/datasource/car_local_data_source.dart';

final carProvider = Provider<CarLocalDataSource>((_) => CarLocalDataSourceImpl());

final carStreamProvider = StreamProvider((ref) => ref.watch(carProvider).watchCars());

class CarLocalDataSourceImpl extends CarLocalDataSource {
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
      final result =  realm.query<CarDto>('TRUEPREDICATE SORT($sort ASC)');
      return result.changes.map((event) => event.results.toList());

    }
    return realm.all<CarDto>().changes.map((event) => event.results.toList());
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
}
