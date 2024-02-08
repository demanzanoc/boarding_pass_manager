import '../../entities/boarding_passes/boardig_pass.dart';

abstract class BoardingPassesRepository {
  Future<void> setBoardingPass(BoardingPass boardingPass);
}
