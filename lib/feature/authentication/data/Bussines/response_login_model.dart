import 'package:metaway_holdings/feature/authentication/data/DTO/login_request.dart';
import 'package:metaway_holdings/feature/authentication/data/DTO/login_response.dart';

class LoginResponseModel {
  final int? code;
  final String? msg;
  final bool? ok;
  final dynamic data;
  final String? i18n;

  LoginResponseModel({
    this.code,
    this.msg,
    this.ok,
    this.data,
    this.i18n,
  });

  factory LoginResponseModel.fromDTO(LoginResponse dto) {
    return LoginResponseModel(
        code: dto.code,
        msg: dto.msg,
        data: dto.data,
        ok: dto.ok,
        i18n: dto.i18n);
  }
}
