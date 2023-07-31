// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../models/car.dart';

class CarsListTile extends StatelessWidget {
  final Car car;
  const CarsListTile({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.13,
      color: (car.mileage >= 15 && car.age <= 5)
          ? Colors.green
          : (car.mileage >= 15 && car.age > 5)
              ? Colors.amber
              : Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${car.name}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Age: ${car.age}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
            Text("Mileage: ${car.mileage}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }
}
