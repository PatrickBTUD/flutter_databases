import 'package:drift_cars/data/cars/data_source/car_local_data_source_impl.dart';
import 'package:drift_cars/domain/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cars = ref.watch(getCarsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drift Cars Demo App'),
      ),
      body: cars.when(
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
                  Text('${data[index].kilometers / 1000} km'),
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
          ref.read(carLocalDataSourceProvider).addCar(
                Car(
                  make: 'BMW',
                  model: '5.30',
                  kilometers: 100000,
                  registrationDate: DateTime(2019, 06),
                ),
              );
        },
        tooltip: 'Add a bmw car',
        child: const Icon(Icons.add),
      ),
    );
  }
}
