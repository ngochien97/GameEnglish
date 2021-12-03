import 'environment.dart';

void main() => Development();

class Development extends Environment {
  final String appName = "Flutter Starter Dev";
  final String baseUrl = 'http://apienglish.thieny.club';
  EnvType environmentType = EnvType.DEVELOPMENT;
}
