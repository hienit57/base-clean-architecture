import 'package:json_annotation/json_annotation.dart';
import 'package:metaway_holdings/feature/authentication/data/DTO/login_request.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int? code;
  final String? msg;
  final bool? ok;
  final dynamic data;
  final String? i18n;

  LoginResponse({
    this.code,
    this.msg,
    this.ok,
    this.data,
    this.i18n,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
