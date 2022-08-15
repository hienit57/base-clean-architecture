import 'package:metaway_holdings/core/environment/environment.dart';

import 'main.dart';

void main() async {
  Environment().initEnv(EnvType.production);
  mainApp();
}
