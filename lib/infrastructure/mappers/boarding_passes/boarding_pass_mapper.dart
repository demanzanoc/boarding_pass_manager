import 'package:boarding_pass_manager/domain/entities/boarding_passes/boarding_pass.dart';
import '../../models/boardig_passes/graphql/boarding_pass_graphql_model.dart';

class BoardingPassMapper {
  static BoardingPassGraphqlModel boardingPassToGraphqlModel(
    BoardingPass boardingPass,
  ) =>
      BoardingPassGraphqlModel(
        age: boardingPass.age,
        airport: boardingPass.airport,
        arrivalTime: boardingPass.arrivalTime,
        departureTime: boardingPass.departureTime,
        email: boardingPass.email,
        flight: boardingPass.flight,
        id: boardingPass.id,
        lastName: boardingPass.lastName,
        name: boardingPass.name,
      );
}
