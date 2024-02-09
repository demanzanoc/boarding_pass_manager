import 'package:boarding_pass_manager/domain/datasources/boarding_passes/boarding_passes_datasource.dart';
import 'package:boarding_pass_manager/domain/entities/boarding_passes/boarding_pass.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../mappers/boarding_passes/boarding_pass_mapper.dart';

class BoardingPassGraphqlDatasource implements BoardingPassesDatasource {
  final GraphQLClient graphQLClient;

  BoardingPassGraphqlDatasource(this.graphQLClient);

  @override
  Future<void> setBoardingPass(BoardingPass boardingPass) async {
    final Map<String, dynamic> json =
        BoardingPassMapper.boardingPassToGraphqlModel(boardingPass).toJson();
    final result =
        await graphQLClient.mutate(_createInsertBoardingPassMutation(json));
    if (result.hasException) {
      throw Exception(
        'Failed to insert boarding pass: ${result.exception.toString()}',
      );
    }
  }

  MutationOptions _createInsertBoardingPassMutation(Map<String, dynamic> json) {
    return MutationOptions(
      document: gql('''
        mutation Insert_BoardingPass(\$boardingPass: BoardingPass_insert_input!) {
          insert_BoardingPass_one(object: \$boardingPass) {
            id
          }
        }
      '''),
      variables: {'boardingPass': json},
    );
  }
}
