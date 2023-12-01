import 'package:json_annotation/json_annotation.dart';
part 'DetailModel.g.dart';

@JsonSerializable()
class DetailModel{
  String login;
  int id;
  String avatar_url;
  String twitter_username;
  int followers;
  int following;
  String email;

  DetailModel({
    required this.login,
    required this.id,
    required this.avatar_url,
    required this.twitter_username,
    required this.followers,
    required this.following,
    required this.email
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => _$DetailModelFromJson(json);
  Map<String, dynamic> toJson() =>_$DetailModelToJson(this);
}