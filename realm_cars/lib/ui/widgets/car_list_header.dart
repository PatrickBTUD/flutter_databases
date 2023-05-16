import 'package:flutter/material.dart';

class CarListHeader extends StatelessWidget {
  const CarListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Make'),
          Text('Model'),
          Text('Mileage'),
          Text('Registration date'),
        ],
      ),
    );
  }
}
