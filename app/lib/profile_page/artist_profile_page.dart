import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/icons.dart';

class ArtistProfilePage extends StatefulWidget {
  @override
  _ArtistProfilePageState createState() => _ArtistProfilePageState();
}

class _ArtistProfilePageState extends State<ArtistProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F3E3),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFA2061E)),
        leading: new IconButton(
          icon: Icon(CustomIcons.back, size: 25,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xF5F7F3E3),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/wyn.jpg"),
                  radius: MediaQuery.of(context).size.width * .167,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BEHIND THE CURTAIN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Text("FOLLOWERS"),
                Text("544", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, letterSpacing: 2),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}