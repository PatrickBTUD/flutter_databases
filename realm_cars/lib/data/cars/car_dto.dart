import 'package:realm/realm.dart';

part 'car_dto.g.dart';

@RealmModel()
class _CarDto {
  @PrimaryKey()
  late ObjectId id;

  late String? make;

  late String? model;

  late int? kilometers;

  late DateTime? registrationDate;

  @override
  String toString() {
    return 'CarDto{make: $make, model: $model, kilometers: '
        '${((kilometers ?? 0)/1000).toStringAsFixed(1)} tsd. km, registrationDate: '
        '${registrationDate?.month}/${registrationDate?.year}';
  }
}
