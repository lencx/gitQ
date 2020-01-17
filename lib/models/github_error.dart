import 'package:json_annotation/json_annotation.dart';

part 'github_error.g.dart';

@JsonSerializable()
class GithubError {
  GithubError();

  String message;

  @JsonKey(name: "documentation_url")
  String documentationUrl;

  factory GithubError.fromJson(Map<String, dynamic> json) => _$GithubErrorFromJson(json);

  Map<String, dynamic> toJson() => _$GithubErrorToJson(this);
}
