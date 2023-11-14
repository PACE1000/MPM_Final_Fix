import 'package:challenge/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget{
  WelcomeScreen({Key? key, required this.username}):super(key: key);

  final String username;
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
      children: <Widget>[
        
        Positioned(
          child: Image.asset("images/welcome/ic_eclipse_welcome.png"),
        right: 0,
        bottom: 200,),
        Positioned(
          child: Image.asset("images/welcome/ic_rectangle_welcome.png"),
        left: 0,
        bottom: 30,),

        Positioned(
          bottom: 0,
          child:Image.asset("images/welcome/ic_welcome.png")),

        Column(

          children: [
          Container(
            padding: EdgeInsets.only(top: 80),
            width:double.maxFinite, 
          margin: EdgeInsets.only(top: 100),
          child: Text("Selamat Datang\nKembali, ${widget.username}!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: "poppins_r"),
            textAlign: TextAlign.center,),),


          Container(
            margin: EdgeInsets.only(top: 80),
            child:Text("Rasakan pengalaman transaksi terbaik\ndengan Syariah",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "poppins_r"),
              textAlign: TextAlign.center,) ,),

              Container(
                margin: EdgeInsets.only(top: 60,left: 20,right: 20),
                width: double.maxFinite,
                height: 40,
                decoration: BoxDecoration(color: Color(0xFF852884),borderRadius: BorderRadius.circular(10)),
                child: TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomeScreen(username: widget.username);
          }));
        }, child: Text("Ayo Mulai!", 
        style: TextStyle(
          color: Colors.white,
          fontFamily: "poppins_r",
          fontSize: 14,),
        )),),

       
        ],),
        
        
      ],
    )
    );
  }
}