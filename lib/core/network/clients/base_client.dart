import 'package:dio/dio.dart';
import 'package:metaway_holdings/feature/authentication/data/DTO/login_request.dart';
import 'package:metaway_holdings/feature/authentication/data/DTO/login_response.dart';
import 'package:retrofit/retrofit.dart';
part 'base_client.g.dart';

@RestApi()
abstract class BaseClient {
  factory BaseClient(Dio dio, {String baseUrl}) = _BaseClient;

  @POST('/m/user/login')
  Future<LoginResponse> loginUser(@Body() LoginRequest request);
}
