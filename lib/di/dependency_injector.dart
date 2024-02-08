import 'package:boarding_pass_manager/domain/datasources/boarding_passes/boarding_passes_datasource.dart';
import 'package:boarding_pass_manager/domain/repositories/boarding_passes/boarding_passes_repository.dart';
import 'package:boarding_pass_manager/infrastructure/datasources/boarding_passes/graphql/boarding_pass_graphql_datasource.dart';
import 'package:boarding_pass_manager/infrastructure/datasources/boarding_passes/graphql/graphql_client_provider.dart';
import 'package:get_it/get_it.dart';
import '../infrastructure/repositories/boarding_passes/boarding_pass_repository_impl.dart';

final di = GetIt.instance;

Future<void> initInjection() async {
  //Repositories
  di.registerLazySingleton<BoardingPassesRepository>(
    () => BoardingPassRepositoryImpl(di.call()),
  );

  //Data sources
  di.registerLazySingleton<BoardingPassesDatasource>(
    () => BoardingPassGraphqlDatasource(di.call()),
  );

  //Third party dependencies
  di.registerLazySingleton(() => GraphqlClientProvider.getClient());
}
