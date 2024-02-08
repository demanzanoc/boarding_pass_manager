import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlClientProvider {
  static GraphQLClient getClient() {
    final HttpLink httpLink = HttpLink(
      'https://alert-lemming-19.hasura.app/v1/graphql',
      defaultHeaders: {
        'x-hasura-admin-secret':
            'en7AUc0ze7LlcYI1m4ssslsZUxZduQrdBvQlBBSQhSw24HpvbVknbuykgik3O1MC'
      },
    );
    return GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }
}
