import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> memo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text("Selamat Datang, ${widget.username}",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),

              Container(
                padding: EdgeInsets.only(top: 30),
                child: 
              Text("Catatan Kamu nich...",style: TextStyle(color: Colors.white,fontFamily: 'poppins_r',fontSize: 24),),)
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(right: 20, bottom: 40),
              child: FloatingActionButton(
                onPressed: () {
                  // Use the addMemoCard method here
                  addMemoCard();
                },
                child: Icon(Icons.plus_one),
              ),
            ),
          ),
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
          Positioned(
            left: 20,
            right: 20,
            bottom: 100,
            top: 100,
            child: ListView.builder(
            itemCount: memo.length,
            itemBuilder: (context, index){
              return buildMemoCard(memo[index]);
            } )),
        ],
      ),
    );
  }

  void addMemoCard() {
    setState(() {
      memo.add("Memo ${memo.length + 1}");
    });
  }
}
Widget buildMemoCard(String memoText) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          memoText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

