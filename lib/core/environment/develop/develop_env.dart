import 'package:json_annotation/json_annotation.dart';

part 'develop_env.g.dart';

@JsonLiteral('develop_env.json', asConst: true)
Map<String, dynamic> get configDevEnvironment => _$configDevEnvironmentJsonLiteral;