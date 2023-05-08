import 'package:realm/realm.dart';

part 'car_dto.g.dart';

@RealmModel()
class _CarDto {
  late String? make;

  late String? model;

  late int? kilometers;

  late DateTime? registrationDate;
}
