import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({Key? key,
  required this.username}):super(key: key);

  final String username;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body:Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Text("Selamat Datang, $username",
            style:TextStyle(color: Colors.white,fontSize: 30)),
          ),
          
        ],
      ) ,
    );
  }
}