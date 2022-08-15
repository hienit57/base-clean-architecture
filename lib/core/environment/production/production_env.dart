import 'package:json_annotation/json_annotation.dart';

part 'production_env.g.dart';

@JsonLiteral('production_env.json', asConst: true)
Map<String, dynamic> get configProductionEnvironment => _$configProductionEnvironmentJsonLiteral;