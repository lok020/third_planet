import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  path: '.env',
  obfuscate: true,
)
abstract class Env {
  @EnviedField(varName: 'API_KEY')
  static String apiKey = _Env.apiKey;

  @EnviedField(varName: 'ENDPOINT')
  static String endpoint = _Env.endpoint;

  @EnviedField(varName: 'IMAGE_URL')
  static String imageUrl = _Env.imageUrl;
}