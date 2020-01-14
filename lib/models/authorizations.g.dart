// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorizations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorizations _$AuthorizationsFromJson(Map<String, dynamic> json) {
  return Authorizations()
    ..note = json['note'] as String
    ..scopes = json['scopes'] as List
    ..clientId = json['client_id'] as String
    ..clientSecret = json['client_secret'] as String;
}

Map<String, dynamic> _$AuthorizationsToJson(Authorizations instance) =>
    <String, dynamic>{
      'note': instance.note,
      'scopes': instance.scopes,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
