import 'package:get_it/get_it.dart';
import 'package:metaway_holdings/core/network/clients/base_client.dart';
import 'package:metaway_holdings/core/network/dio/dio_config.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<BaseClient>(BaseClient(apiprovider()));
}
