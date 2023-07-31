import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zylu/components/CarsListTile.dart';
import 'package:zylu/models/car.dart';
import 'package:zylu/providers/carDataProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<CarProvider>(context).fetchAndSetCars().then((_) {
        setState(() {
          _isInit = false;
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Car> car = Provider.of<CarProvider>(context).cars;
    return Scaffold(
      appBar: AppBar(title: const Text("Cars Coding")),
      body: (_isLoading)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (ctx, i) {
                return CarsListTile(car: car[i]);
              },
              itemCount: car.length,
              separatorBuilder: (ctx, i) {
                return const SizedBox(height: 8);
              },
            ),
    );
  }
}
