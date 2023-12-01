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
            left: 0,
            top: 600,
            child: Image.asset("images/loginpage/ic_ellipse_home.png"),
          ),
          Positioned(
            left: 0,
            child: Image.asset("images/loginpage/ic_ellipse_home.png"),
          ),
          Positioned(
            left: 0,
            top: 300,
            child: Image.asset("images/welcome/ic_rectangle_welcome.png"),
          ),
          Positioned(
            right: 0,
            child: Image.asset("images/welcome/ic_eclipse_welcome.png"),
          ),
          Container(
            height: double.maxFinite,
            width: MediaQuery.of(context).size.height,
            child: _body(),
          ),
          
          
          
          
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

  Widget _detail (DetailModel detail){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(detail.avatar_url),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(10),
              width: 500,
              height: 200,
              child: Card(
                margin: EdgeInsets.all(10),
                
                child: Column(
                  children: [
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
              Text('Email: ${detail.email}', style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
            ),
          ],
        );
  }
  
}
