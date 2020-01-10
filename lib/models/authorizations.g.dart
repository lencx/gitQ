// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorizations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorizations _$AuthorizationsFromJson(Map<String, dynamic> json) {
  return Authorizations()
    ..appName = json['app_name'] as String
    ..note = json['note'] as String
    ..scopes = json['scopes'] as List
    ..clientId = json['client_id'] as String
    ..clientSecret = json['client_secret'] as String;
}

Map<String, dynamic> _$AuthorizationsToJson(Authorizations instance) =>
    <String, dynamic>{
      'app_name': instance.appName,
      'note': instance.note,
      'scopes': instance.scopes,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
