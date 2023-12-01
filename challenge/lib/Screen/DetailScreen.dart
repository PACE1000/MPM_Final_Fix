import 'package:challenge/Service/ApiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:challenge/Models/DetailModel.dart';

class DetailScreen extends StatelessWidget{
  DetailScreen({
    Key? key,
    required this.login
    }):super(key: key);
  final String login;
  @override
  Widget build(BuildContext context){
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

  FutureBuilder _body(){
  final apiservice = ApiService(Dio(BaseOptions(
    contentType: "application/json")),
    authToken: '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');

  return FutureBuilder(
    future: apiservice.getDetail(login), 
    builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        return Text(snapshot.toString());
        if(snapshot.hasData){
          final DetailModel details = snapshot.data!;
          return Expanded(
            child: _detail(details));
        }else{
          return Text("User tidak ditemukan");
        }
      }else{
        return Center(
          child: CircularProgressIndicator());
      }
    }
  );
}

  Widget _detail(DetailModel details){
    return ListView.builder(
      itemBuilder:(context,index) {
        return Container(
          child: Text(details.login,
          style: TextStyle(color: Colors.black),),
        );
      });
  }
}