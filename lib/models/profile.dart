import 'package:json_annotation/json_annotation.dart';
import "cache_config.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();

  String user;

  String token;

  num theme;

  CacheConfig cache;

  @JsonKey(name: "last_login")
  String lastLogin;

  String locale;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
