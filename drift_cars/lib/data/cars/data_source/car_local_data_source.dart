import 'package:drift_cars/domain/car.dart';

abstract class CarLocalDataSource {
  Future<void> addCar(Car car);
}
