import 'package:get_it/get_it.dart';
import 'package:base_clean_architecturetecture/core/network/clients/base_client.dart';
import 'package:base_clean_architecturetecture/core/network/dio/dio_config.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<BaseClient>(BaseClient(apiprovider()));
}
