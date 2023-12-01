// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      login: json['login'] as String,
      id: json['id'] as int,
      avatar_url: json['avatar_url'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatar_url,
      'type': instance.type,
    };
