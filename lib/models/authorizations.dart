import 'package:json_annotation/json_annotation.dart';

part 'authorizations.g.dart';

@JsonSerializable()
class Authorizations {
  Authorizations();

  String appName;

  String callback;

  List scopes;

  @JsonKey(name: "client_id")
  String clientId;

  @JsonKey(name: "client_secret")
  String clientSecret;

  factory Authorizations.fromJson(Map<String, dynamic> json) => _$AuthorizationsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationsToJson(this);
}
