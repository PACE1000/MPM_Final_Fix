import 'package:challenge/Screen/LoginScreen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  RegisterScreen({Key? key}):super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen>{
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repassword = TextEditingController();
  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body:Stack(
        children: <Widget>[
            Positioned(
              right: 0,
              top: 100,
              child: Image.asset("images/ic_rectangle.png")),

            Positioned(
              left: 0,
              top: 250,
              child: Image.asset("images/loginpage/ic_ellipse_home.png")),

            Positioned(
              left: 0,
              right: 0,
              top: 200  ,
              child: Column(
                children: <Widget>[
                  Image.asset("images/iv_login.png"),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Card(
                    child: 
                  //Username
                  Column(
                    children: [

                    Container(
                      padding: EdgeInsets.only(top: 20,bottom: 20),
                      child: Text("Assalamualaikum",
                      style: TextStyle(color: Color(0xFF39B54A),fontFamily: "poppins_b",fontSize: 20),),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                      controller: username,
                      decoration: InputDecoration(
                      hintText: "Masukkan Username",
                      border:OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)) ),),
                    ),
                    
                    
                    
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                      decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(10)) ),
                      child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      border:OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.only(right: 10),
                        icon: Icon(isPasswordObscure ? Icons.remove_red_eye: Icons.remove_red_eye_outlined),
                        onPressed: (){
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                      )
                       ),obscureText: isPasswordObscure,
                       
                       
                    ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                      decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(10)) ),
                      child: TextField(
                      controller: repassword,
                      decoration: InputDecoration(
                      hintText: "Masukkan Password Lagi",
                      border:OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.only(right: 10),
                        icon: Icon(isPasswordObscure ? Icons.remove_red_eye: Icons.remove_red_eye_outlined),
                        onPressed: (){
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                      )
                       ),obscureText: isPasswordObscure,
                       
                       
                    ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0xFF852884),
                        shape: BoxShape.rectangle, 
                        borderRadius: BorderRadius.all(Radius.circular(10))),

                      child:TextButton(
                        onPressed: (){
                        
                        if(username.text.isEmpty || password.text.isEmpty|| repassword.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Username / Password Harus Diisi"),backgroundColor: Colors.red,));
                          return;
                        }else{
                          if(password.text == repassword.text){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Berhasil disimpan"),backgroundColor: Colors.green,));
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return LoginScreen();
                            }));
                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password tidak sama"),backgroundColor: Colors.red,));
                          }
                        }
                        
                          }, child: Text("Daftar",
                      style:TextStyle(color: Colors.white) ,)) ,),

                      
                  ]
                  ),
                  ),
                  )
                ],
              ) )
        ],
      ) ,
    );
  }
}