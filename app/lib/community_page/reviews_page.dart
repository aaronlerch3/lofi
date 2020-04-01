import 'package:lofi/community_page/reviews_feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ReviewsFeed(),
        ],
      ),
      backgroundColor: Color(0xFFF7F3E3),
    );
  }
}