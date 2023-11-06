import 'package:challenge/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget{
  LoginScreen({Key? key}):super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body: 
      Column(
        children: <Widget>[
          //Login Text
          Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            alignment: Alignment.center,
            child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 30, fontFamily: 'poppins_r'),),
          ),

          //Username
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 10),
            alignment: Alignment.center,
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                hintText: "Masukkan Nama", 
                hintStyle: TextStyle(
                  fontFamily: 'poppins_r'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.purple),),
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black),),
                        filled: true,
                        fillColor: Colors.white,
                          ),
                          
            ),
          ),

          //Password
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 10),
            child: TextField(
              decoration: InputDecoration(hintText: "Masukkan Password",hintStyle: TextStyle(fontFamily: 'poppins_r'),
              focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              fillColor: Colors.white,
              filled: true ),
              obscureText: true,
            ),
          ),

          //Button Pindah Home
          Container(
  margin: EdgeInsets.all(20),

  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.purple),
  child: TextButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomeScreen(username: username.text);
        },
      ));
    },
    child: Text(
      "LOGIN",
      style: TextStyle(color: Colors.white),
    ),
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    )
  ),
)

        ],
      ),
    );
  }
} 