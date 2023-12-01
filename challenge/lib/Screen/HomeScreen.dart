import 'package:challenge/Models/UsersModel.dart';
import 'package:challenge/Screen/DetailScreen.dart';
import 'package:challenge/Service/ApiService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
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

          Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text("Selamat Datang, ${widget.username}",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Container(
                child: _body(),
              )
            ],
          ),
        ],
      ),
    );
  }

  FutureBuilder _body(){
    final apiservice = ApiService(Dio(BaseOptions(
      contentType: "application/json")),
      authToken: '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');

    return FutureBuilder(
      future: apiservice.getusers(), 
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasData){
            final List<UsersModel> users = snapshot.data!;
          return Expanded(child: _users(users));
          }else{
            return Text("Tidak ada Data");
          }
          
        } else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
  }

  Widget _users(List<UsersModel> users){
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(login: users[index].login,)));},
          child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF852884),width: 2),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(users[index].avatar_url,width: 80,height: 80),
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(users[index].login,
                        style: TextStyle(
                          fontFamily: 'poppins_b',
                          color: Colors.black),),
                  ),
                  Row(
                    children: [
                      Text('ID: '+users[index].id.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('Tipe User: '+users[index].type),
                      )
                    ],
                  )
                ],
              ),
              )
            ],
          ),
        ),
        );
      },
    );
  }  
}
