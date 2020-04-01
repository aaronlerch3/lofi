import 'package:lofi/community_page/discussion_feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        leading: null,
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('COMMUNITY', style: TextStyle(color: Color(0xFF151F20), fontWeight: FontWeight.w700, fontSize: 20),),
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('REVIEWS', style: TextStyle(color: Color(0xFF151F20), fontWeight: FontWeight.w700, fontSize: 20),),
              ],
            ),
          ),
        ],
        backgroundColor: Color(0xF5F7F3E3),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          DiscussionFeed(),
        ],
      ),
      backgroundColor: Color(0xFFF7F3E3),
    );
  }
}