import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm_cars/data/cars/car_dto.dart';
import 'package:realm_cars/data/cars/datasource/car_local_data_source_impl.dart';

class CarListTile extends ConsumerWidget {
  final CarDto car;

  const CarListTile({required this.car, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(carProvider).updateKilometers(car: car, addKilometers: 1000);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Dismissible(
          key: Key(car.id.toString()),
          onDismissed: (_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Deleted: ${car.toString()}')));
            ref.read(carProvider).deleteCar(car: car);
          },
          background: Container(
            color: Colors.red,
            child: Text(
              'Deleting...: ${car.toString()}',
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(car.make ?? ''),
              Text(car.model ?? ''),
              Text('${((car.kilometers ?? 0) / 1000).toStringAsFixed(1)} tsd. km'),
              Text('${car.registrationDate?.month}/${car.registrationDate?.year}'),
            ],
          ),
        ),
      ),
    );
  }
}
