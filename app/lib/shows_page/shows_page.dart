import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/shows_page/map_page.dart';
import 'package:lofi/shows_page/showlist_page.dart';

class Shows extends StatefulWidget {
  @override
  _ShowsState createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFF151F20),
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0x80F7F3E3),width: 1.5),
                  insets: EdgeInsets.symmetric(horizontal: 25)
              ),
              tabs: <Widget>[
                Tab(
                  child: Text("MAP", style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFFF7F3E3), fontSize: 20, fontWeight: FontWeight.w700),),
                ),
                Tab(
                  child: Text("LIST", style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFFF7F3E3), fontSize: 20, fontWeight: FontWeight.w700),),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MapPage(),
              ShowList(),
            ],
          ),
        ),
      ),
    );
  }
}