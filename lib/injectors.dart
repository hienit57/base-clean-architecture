import 'package:base_clean_architecture/core/network/clients/base_client.dart';
import 'package:base_clean_architecture/core/network/dio/dio_config.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<BaseClient>(BaseClient(apiprovider()));
}
