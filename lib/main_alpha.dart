import 'package:base_clean_architecture/core/environment/environment.dart';

import 'main.dart';

void main() async {
  Environment().initEnv(EnvType.develop);
  mainApp();
}
