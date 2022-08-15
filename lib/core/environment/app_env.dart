import 'package:json_annotation/json_annotation.dart';

part 'app_env.g.dart';

@JsonSerializable()
class AppEnv {
  @JsonKey(name: 'base_url')
  String baseUrl;

  AppEnv(this.baseUrl);

  factory AppEnv.fromJson(Map<String, dynamic> json) =>
      _$AppEnvFromJson(json);
}