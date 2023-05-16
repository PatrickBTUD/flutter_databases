import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm_cars/data/cars/car_dto.dart';
import 'package:realm_cars/data/cars/datasource/car_local_data_source.dart';
import 'package:realm_cars/data/cars/datasource/car_local_data_source_impl.dart';
import 'package:realm_cars/ui/router/app_router.gr.dart';
import 'package:realm_cars/ui/widgets/car_list_header.dart';
import 'package:realm_cars/ui/widgets/car_list_tile.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carStream = ref.watch(carProvider).watchCars(sortBy: SortBy.kilometers);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realm Demo'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  final result = ref.watch(carProvider).getHighestKilometers();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(result.toString())));
                },
                child: const Text('Get highest km'),
              ),
              TextButton(
                onPressed: () {
                  final result = ref.watch(carProvider).getLowestKilometers();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(result.toString())));
                },
                child: const Text('Get lowest km'),
              )
            ],
          ),
          Expanded(
            child: StreamBuilder<List<CarDto>>(
              stream: carStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    final data = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: data.length + 1,
                      itemBuilder: (context, index) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text('No cars available'),
                          );
                        }
                        if (index == 0) {
                          return const CarListHeader();
                        }
                        index -= 1;
                        return CarListTile(car: data[index]);
                      },
                    );
                  }
                }
                return const Center(child: Text('No cars available'));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          AutoRouter.of(context).navigate(AddCarRoute());
        },
      ),
    );
  }
}
