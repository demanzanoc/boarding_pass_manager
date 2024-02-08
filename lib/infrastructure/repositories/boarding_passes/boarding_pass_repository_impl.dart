import 'package:boarding_pass_manager/domain/datasources/boarding_passes/boarding_passes_datasource.dart';
import 'package:boarding_pass_manager/domain/entities/boarding_passes/boardig_pass.dart';
import 'package:boarding_pass_manager/domain/repositories/boarding_passes/boarding_passes_repository.dart';

class BoardingPassRepositoryImpl implements BoardingPassesRepository {
  final BoardingPassesDatasource datasource;

  BoardingPassRepositoryImpl(this.datasource);

  @override
  Future<void> setBoardingPass(BoardingPass boardingPass) =>
      datasource.setBoardingPass(boardingPass);
}
