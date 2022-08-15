import 'package:base_clean_architecture/core/network/clients/base_client.dart';
import 'package:base_clean_architecture/core/network/dio/result.dart';
import 'package:base_clean_architecture/feature/authentication/data/Bussines/response_login_model.dart';
import 'package:base_clean_architecture/feature/authentication/data/DTO/login_request.dart';
import 'package:base_clean_architecture/injectors.dart';

abstract class UserRepository {
  Future<Result<LoginResponseModel>> loginRequest(LoginRequest request);
}

class UserImp extends UserRepository {
  final BaseClient _baseClient = injector();

  @override
  Future<Result<LoginResponseModel>> loginRequest(LoginRequest request) {
    return runCatchingAsync(() async {
      final response = await _baseClient.loginUser(request);
      return LoginResponseModel.fromDTO(response);
    });
  }
}
