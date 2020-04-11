import 'package:lofi/home_page/messages.dart';
import 'package:lofi/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/profile_page/profile_page.dart';
import 'bottom_nav.dart';

class Layout extends StatelessWidget {
  final Widget child;
  Layout({this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //appBar
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFF7F3E3)),
        leading: new IconButton(
          icon: Icon(CustomIcons.user, size: 30,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        title: new Icon(
          CustomIcons.logo,
          size: 45,
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.mode_comment, size: 30, color: Color(0xFFF7F3E3)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Messages()));
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFC151F20),
      ),
      body: child,
      //bottomNav
      bottomNavigationBar: BottomNav(),
    );
  }
}
