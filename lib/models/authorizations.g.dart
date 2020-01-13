// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorizations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorizations _$AuthorizationsFromJson(Map<String, dynamic> json) {
  return Authorizations()
    ..note = json['note'] as String
    ..noteUrl = json['note_url'] as String
    ..scopes = json['scopes'] as List;
}

Map<String, dynamic> _$AuthorizationsToJson(Authorizations instance) =>
    <String, dynamic>{
      'note': instance.note,
      'note_url': instance.noteUrl,
      'scopes': instance.scopes,
    };
