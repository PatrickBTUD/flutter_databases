import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:realm_cars/data/cars/datasource/car_local_data_source_impl.dart';

@RoutePage()
class AddCarScreen extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  AddCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final makeController = useTextEditingController();
    final modelController = useTextEditingController();
    final kilometersController = useTextEditingController();
    final registrationController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Flex(
            direction: Axis.vertical,
            children: [
              TextFormField(
                controller: makeController,
                decoration: const InputDecoration(
                  helperText: 'Make',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Make should not be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: modelController,
                decoration: const InputDecoration(
                  helperText: 'Model',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Model should not be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kilometersController,
                decoration: const InputDecoration(
                  helperText: 'Mileage',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Kilometers should not be empty';
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () async {
                  final selected = await showMonthYearPicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1886),
                    lastDate: DateTime.now(),
                  );
                  registrationController.text = selected?.toIso8601String() ?? '';
                },
                child: const Text('Add Registration'),
              ),
              TextFormField(
                controller: registrationController,
                enabled: false,
                decoration: const InputDecoration(
                  helperText: 'Registration date',
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Registration date should not be empty';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        ref.read(carProvider).addCar(
                              make: makeController.text,
                              model: modelController.text,
                              kilometers: int.parse(kilometersController.text),
                              registrationDate: DateTime.parse(registrationController.text),
                            );
                        AutoRouter.of(context).pop();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
