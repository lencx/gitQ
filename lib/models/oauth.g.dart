// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oauth _$OauthFromJson(Map<String, dynamic> json) {
  return Oauth()
    ..id = json['id'] as num
    ..url = json['url'] as String
    ..app = json['app'] as Map<String, dynamic>
    ..token = json['token'] as String
    ..hashedToken = json['hashed_token'] as String
    ..tokenLastEight = json['token_last_eight'] as String
    ..note = json['note'] as String
    ..noteUrl = json['note_url'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..scopes = json['scopes'] as List
    ..fingerprint = json['fingerprint'] as String;
}

Map<String, dynamic> _$OauthToJson(Oauth instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'app': instance.app,
      'token': instance.token,
      'hashed_token': instance.hashedToken,
      'token_last_eight': instance.tokenLastEight,
      'note': instance.note,
      'note_url': instance.noteUrl,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'scopes': instance.scopes,
      'fingerprint': instance.fingerprint,
    };
