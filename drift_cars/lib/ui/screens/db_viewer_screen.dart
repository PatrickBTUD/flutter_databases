import 'package:auto_route/annotations.dart';
import 'package:drift_cars/data/cars/data_source/car_local_data_source_impl.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DBViewerScreen extends ConsumerWidget {
  const DBViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(carLocalDataSourceProvider);
    return DriftDbViewer(database);
  }
}
