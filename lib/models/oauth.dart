import 'package:json_annotation/json_annotation.dart';

part 'oauth.g.dart';

@JsonSerializable()
class Oauth {
  Oauth();

  num id;

  String url;

  Map<String, dynamic> app;

  String token;

  @JsonKey(name: "hashed_token")
  String hashedToken;

  @JsonKey(name: "token_last_eight")
  String tokenLastEight;

  String note;

  @JsonKey(name: "note_url")
  String noteUrl;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  List scopes;

  String fingerprint;

  factory Oauth.fromJson(Map<String, dynamic> json) => _$OauthFromJson(json);

  Map<String, dynamic> toJson() => _$OauthToJson(this);
}
