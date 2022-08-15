import 'package:metaway_holdings/core/environment/app_env.dart';
import 'package:metaway_holdings/core/environment/production/production_env.dart';
import 'package:metaway_holdings/core/environment/staging/staging_env.dart';

import 'develop/develop_env.dart';

enum EnvType { develop, staging, production }

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();
  static final Environment _singleton = Environment._internal();
  late AppEnv _appEnv;

  initEnv(EnvType type) {
    switch (type) {
      case EnvType.develop:
        _appEnv = AppEnv.fromJson(configDevEnvironment);
        break;
      case EnvType.staging:
        _appEnv = AppEnv.fromJson(configStagingEnvironment);
        break;
      case EnvType.production:
        _appEnv = AppEnv.fromJson(configProductionEnvironment);
        break;
    }
  }

  AppEnv env() {
    return _appEnv;
  }
}
