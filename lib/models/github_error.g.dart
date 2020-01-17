// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubError _$GithubErrorFromJson(Map<String, dynamic> json) {
  return GithubError()
    ..message = json['message'] as String
    ..documentationUrl = json['documentation_url'] as String;
}

Map<String, dynamic> _$GithubErrorToJson(GithubError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'documentation_url': instance.documentationUrl,
    };
