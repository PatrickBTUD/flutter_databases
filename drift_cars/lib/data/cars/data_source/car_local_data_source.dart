import 'package:drift_cars/data/cars/data_source/car_local_data_source_impl.dart';
import 'package:drift_cars/domain/car.dart';

abstract class CarLocalDataSource {
  Future<void> addCar(Car car);
  Future<List<CarDtoData>> getCars();
  Stream<List<CarDtoData>> get carsStream;
}
