import 'package:json_annotation/json_annotation.dart';

part 'authorizations.g.dart';

@JsonSerializable()
class Authorizations {
  Authorizations();

  String note;

  @JsonKey(name: "note_url")
  String noteUrl;

  List scopes;

  factory Authorizations.fromJson(Map<String, dynamic> json) => _$AuthorizationsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationsToJson(this);
}
