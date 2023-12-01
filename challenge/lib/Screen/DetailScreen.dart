import 'package:challenge/Service/ApiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:challenge/Models/DetailModel.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.login}) : super(key: key);
  final String login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            child: Image.asset("images/welcome/ic_eclipse_welcome.png"),
          ),
          Positioned(
            left: 0,
            top: 300,
            child: Image.asset("images/welcome/ic_rectangle_welcome.png"),
          ),
          Positioned(
            left: 0,
            top: 600,
            child: Image.asset("images/loginpage/ic_ellipse_home.png"),
          ),
          Positioned(
            left: 0,
            child: Image.asset("images/loginpage/ic_ellipse_home.png"),
          ),
          Container(
            child: _body(),
          )
        ],
      ),
    );
  }

  FutureBuilder _body() {
    final apiservice = ApiService(
        Dio(BaseOptions(contentType: "application/json")),
        authToken: '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');

    return FutureBuilder(
        future: apiservice.getDetail(login),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            /*
            DetailModel detail = snapshot.data!;
            return Text(detail.login);
            */
            if (snapshot.hasData) {
              DetailModel detail = snapshot.data!;
              return Expanded(child: _detail(detail));
            } else {
              return Text("User tidak ditemukan");
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _detail(DetailModel detail) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(detail.avatar_url),
            ),
            SizedBox(height: 16),
            Text('Login: ${detail.login}', style: TextStyle(fontSize: 18)),
            Text('ID: ${detail.id}', style: TextStyle(fontSize: 18)),
            Text('Followers: ${detail.followers}',
                style: TextStyle(fontSize: 18)),
            Text('Following: ${detail.following}',
                style: TextStyle(fontSize: 18)),
            if (detail.twitter_username != null)
              Text('Twitter: ${detail.twitter_username}',
                  style: TextStyle(fontSize: 18)),
            if (detail.email != null)
              Text('Email: ${detail.email}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
