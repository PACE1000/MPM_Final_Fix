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

  FutureBuilder<List<DetailModel>> _body(){
  final apiservice = ApiService(Dio(BaseOptions(
    contentType: "application/json")),
    authToken: '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');

  return FutureBuilder<List<DetailModel>>(
    future: apiservice.getDetail(login), 
    builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        return Text(login);
        if(snapshot.hasData){
          final List<DetailModel> details = snapshot.data!;
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

  Widget _detail(List<DetailModel>details){
    return ListView.builder(
      itemCount: details.length,
      itemBuilder:(context,index) {
        return Container(
          child: Text(details[index].login,
          style: TextStyle(color: Colors.black),),
        );
      });
  }
}