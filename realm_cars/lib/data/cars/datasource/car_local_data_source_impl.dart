import 'package:realm/realm.dart';
import 'package:realm_cars/data/cars/car_dto.dart';
import 'package:realm_cars/data/cars/datasource/car_local_data_source.dart';

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
  Stream<List<CarDto>> watchCars() {
    return realm.all<CarDto>().changes.map((event) => event.results.toList());
  }
}
