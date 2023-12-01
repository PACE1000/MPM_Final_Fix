// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      login: json['login'] as String,
      id: json['id'] as int,
      avatar_url: json['avatar_url'] as String,
      twitter_username: json['twitter_username'] as String,
      followers: json['followers'] as int,
      following: json['following'] as int,
      email: json['email'] as String,
    );

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatar_url,
      'twitter_username': instance.twitter_username,
      'followers': instance.followers,  
      'following': instance.following,
      'email': instance.email,
    };
