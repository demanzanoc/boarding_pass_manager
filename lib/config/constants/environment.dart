import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String gqlApiKey = dotenv.env['GQL_API_KEY'] ?? 'No api key';
}