import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../config/constants/environment.dart';

class GraphqlClientProvider {
  static GraphQLClient getClient() {
    final HttpLink httpLink = HttpLink(
      'https://alert-lemming-19.hasura.app/v1/graphql',
      defaultHeaders: {'x-hasura-admin-secret': Environment.gqlApiKey},
    );
    return GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }
}
