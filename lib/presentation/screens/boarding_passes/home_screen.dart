import 'package:boarding_pass_manager/domain/entities/boarding_passes/boardig_pass.dart';
import 'package:boarding_pass_manager/domain/repositories/boarding_passes/boarding_passes_repository.dart';
import 'package:flutter/material.dart';
import '../../../di/dependency_injector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BoardingPassesRepository repo = di<BoardingPassesRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Boarding Pass Manager')),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _setData(repo);
          },
          child: const Text('Set Data'),
        ),
      ),
    );
  }

  void _setData(BoardingPassesRepository repo) async {
    await repo.setBoardingPass(
      BoardingPass(
        age: 29,
        airport: 'airport',
        arrivalTime: DateTime.now(),
        departureTime: DateTime.now(),
        email: 'email@email.com',
        flight: '2222',
        id: 'bb632d90-9624-475e-a61b-4e07200ac445',
        lastName: 'Matias',
        name: 'Yañez',
      ),
    );
  }
}
