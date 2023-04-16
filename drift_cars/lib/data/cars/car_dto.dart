import 'package:drift/drift.dart';

class CarDto extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get make => text()();
  TextColumn get model => text()();
  IntColumn get kilometers => integer()();
  DateTimeColumn get registrationDate => dateTime()();
}