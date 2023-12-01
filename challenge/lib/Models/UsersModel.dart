  import 'package:json_annotation/json_annotation.dart';
  part 'UsersModel.g.dart';

  @JsonSerializable()
  class UsersModel{
    String login;
    int id;
    String avatar_url;
    String type;

    UsersModel({
      required this.login,
      required this.id,
      required this.avatar_url,
      required this.type
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => _$UsersModelFromJson(json);
    Map<String, dynamic> toJson() => _$UsersModelToJson(this);
  }