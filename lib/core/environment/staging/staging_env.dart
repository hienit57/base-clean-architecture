import 'package:json_annotation/json_annotation.dart';

part 'staging_env.g.dart';

@JsonLiteral('staging_env.json', asConst: true)
Map<String, dynamic> get configStagingEnvironment => _$configStagingEnvironmentJsonLiteral;