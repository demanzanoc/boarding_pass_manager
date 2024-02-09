import '../../entities/boarding_passes/boarding_pass.dart';

abstract class BoardingPassesRepository {
  Future<void> setBoardingPass(BoardingPass boardingPass);
}
