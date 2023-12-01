import 'package:challenge/Models/DetailModel.dart';
import 'package:challenge/Models/UsersModel.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'ApiService.g.dart';

@RestApi(baseUrl:'https://api.github.com/')
abstract class ApiService{
  factory ApiService(Dio dio, {String? authToken}){
    dio.options.headers['Authorization'] = 'Bearer $authToken';
    dio.options.headers['Accept'] = 'application/vnd.github+json';
    return _ApiService(dio);
  }

  @GET('users')
  Future<List<UsersModel>> getusers();

  @GET('users/{login}')
  Future<List<DetailModel>> getDetail(@Path("login") String login);
}