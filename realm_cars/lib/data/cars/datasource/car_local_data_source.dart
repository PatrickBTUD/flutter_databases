import 'package:realm_cars/data/cars/car_dto.dart';

abstract class CarLocalDataSource {
  List<CarDto> getCars();

  Stream<List<CarDto>> watchCars();

  void addCar({
    required String make,
    required String model,
    required int kilometers,
    required DateTime registrationDate,
  });
}
