import 'package:realm_cars/data/cars/car_dto.dart';

enum SortBy {
  make('make'),
  model('model'),
  kilometers('kilometers'),
  registrationDate('registrationDate');

  final String value;

  const SortBy(this.value);

  factory SortBy.fromValue(String value) {
    return SortBy.values.firstWhere((element) => element.value == value);
  }
}

abstract class CarLocalDataSource {
  List<CarDto> getCars();

  Stream<List<CarDto>> watchCars({SortBy? sortBy});

  void addCar({
    required String make,
    required String model,
    required int kilometers,
    required DateTime registrationDate,
  });
}
