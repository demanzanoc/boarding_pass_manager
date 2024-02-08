import 'package:boarding_pass_manager/domain/entities/boarding_passes/boardig_pass.dart';

abstract class BoardingPassesDatasource {
  Future<void> setBoardingPass(BoardingPass boardingPass);
}
