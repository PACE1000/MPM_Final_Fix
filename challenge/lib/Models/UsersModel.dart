// ignore_for_file: non_constant_identifier_names, file_names

import 'package:json_annotation/json_annotation.dart';
part 'UsersModel.g.dart';

@JsonSerializable()
class UsersModel {
  String login;
  String id;
  String avatar_url;
  String type;

  UsersModel(
      {required this.login,
      required this.id,
      required this.avatar_url,
      required this.type});

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}
