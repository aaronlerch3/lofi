import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/community_page/discussion_page.dart';
import 'package:lofi/community_page/reviews_page.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFFF7F3E3),
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0x80151F20),width: 1.5),
                  insets: EdgeInsets.symmetric(horizontal: 25)
              ),
              tabs: <Widget>[
                Tab(
                  child: Text("FORUMS", style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF151F20), fontSize: 20, fontWeight: FontWeight.w700),),
                ),
                Tab(
                  child: Text("REVIEWS", style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF151F20), fontSize: 20, fontWeight: FontWeight.w700),),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CommunityPage(),
              ReviewsPage(),
            ],
          ),
        ),
      ),
    );
  }
}