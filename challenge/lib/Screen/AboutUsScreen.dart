import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget{
  AboutUsScreen({Key? key}):super(key: key);


  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: Colors.green,
      body:Stack(
        children: [
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
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 240),
                  child: Text("Anggota Kelompok",
                  style: TextStyle(
                    fontFamily: 'poppins_b',
                    fontSize: 20,
                    color: Colors.white),),),

                 Container(
                  margin: EdgeInsets.only(top:10),
                  child: Text("Alif Rachmat Ilahi 21060120120015\nAndromedha Anjar Wasari 21060120130117\nArya Bramaputra 21060120120033\nAlexander Caisar Simamora 21060120140185\nDani Sefianto 21060120120024\nFadhil Prawira 21060120140057\nGevin Faza Qinthara 21060120140168\nLukman Sanusi 21060120130140\nNadhif Lazuardi Aulia Rahim 21060120120004\nYudhi Winantoro 21060120120009",
                  style: TextStyle(
                    fontFamily: 'poppins_r',
                    fontSize: 12,
                    color: Colors.white
                    ),),alignment: Alignment.center,),
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}