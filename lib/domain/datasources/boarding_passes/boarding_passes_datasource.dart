import 'package:boarding_pass_manager/domain/entities/boarding_passes/boarding_pass.dart';

abstract class BoardingPassesDatasource {
  Future<void> setBoardingPass(BoardingPass boardingPass);
}
