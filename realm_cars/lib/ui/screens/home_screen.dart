import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm_cars/data/cars/datasource/car_local_data_source_impl.dart';
import 'package:realm_cars/ui/router/app_router.gr.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carStream = ref.watch(carStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realm Demo'),
      ),
      body: carStream.when(
        data: (data) {
          return ListView.builder(
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
                    Text(data[index].make ?? ''),
                    Text(data[index].model ?? ''),
                    Text('${data[index].kilometers ?? 0 / 1000} tsd. km'),
                    Text(
                        '${data[index].registrationDate?.month}/${data[index].registrationDate?.year}'),
                  ],
                ),
              );
            },
          );
        },
        error: (error, trace) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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
