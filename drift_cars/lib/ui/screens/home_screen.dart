import 'package:auto_route/auto_route.dart';
import 'package:drift_cars/data/cars/data_source/car_local_data_source_impl.dart';
import 'package:drift_cars/ui/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carsStream = ref.watch(carsStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drift Cars Demo App'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(carLocalDataSourceProvider).advancedQueries();
              AutoRouter.of(context).navigate(const DBViewerRoute());
            },
            icon: const Icon(Icons.table_rows_outlined),
          ),
        ],
      ),
      body: carsStream.when(
        data: (data) => ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            if (data.isEmpty) {
              return const Center(
                child: Text('No cars availavle'),
              );
            }
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Make'),
                    Text('Model'),
                    Text('Milage'),
                    Text('Registration date'),
                  ],
                ),
              );
            }
            index -= 1;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data[index].make),
                  Text(data[index].model),
                  Text('${data[index].kilometers / 1000} tsd. km'),
                  Text(
                      '${data[index].registrationDate.month}/${data[index].registrationDate.year}'),
                ],
              ),
            );
          },
        ),
        error: (_, __) => const Center(
          child: Text('An error occurred'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).navigate(AddCarRoute());
        },
        tooltip: 'Add a car',
        child: const Icon(Icons.add),
      ),
    );
  }
}
