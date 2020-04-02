import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscussionFeed extends StatefulWidget {
  @override
  _DiscussionFeedState createState() => _DiscussionFeedState();
}

class _DiscussionFeedState extends State<DiscussionFeed> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    List<String> user = new List<String>();
    user.add('experienced_user1');
    user.add('new_user12');
    user.add('lead_guitar1');
    user.add('drummerDude123');
    user.add('other_user5');
    user.add('other_user5');
    user.add('other_user5');
    user.add('other_user5');
    user.add('other_user5');
    user.add('other_user5');
    List<String> title = new List<String>();
    title.add("Finding gigs in NYC");
    title.add("Venues with decent food in Hoboken?");
    title.add("Looking for bassist in NYC area!");
    title.add("Need practice space in Hoboken!!");
    title.add("Lorem ipsum dolor sit amet!");
    title.add("Lorem ipsum dolor sit amet!");
    title.add("Lorem ipsum dolor sit amet!");
    title.add("Lorem ipsum dolor sit amet!");
    title.add("Lorem ipsum dolor sit amet!");
    title.add("Lorem ipsum dolor sit amet!");
    List<String> tag = new List<String>();
    tag.add("P&F");
    tag.add("DISCUSSION");
    tag.add("LOOKING FOR");
    tag.add("LOOKING FOR");
    tag.add("OTHER");
    tag.add("OTHER");
    tag.add("OTHER");
    tag.add("OTHER");
    tag.add("OTHER");
    tag.add("OTHER");
    for (var i = 0; i < user.length; i++) {
      children.add(Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 9, bottom: 5, left: 15),
                  child: Column(
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFA2061E),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 3, bottom: 3, left: 7, right: 7),
                          child: Text(
                            tag[i],
                            style: TextStyle(
                                color: Color(0xFFF7F3E3),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, top: 9, bottom: 5),
                  child: Column(
                    children: <Widget>[
                      Text(
                        user[i],
                        style: TextStyle(fontSize: 13.5),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Text(
                    title[i],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Divider(
              color: Color(0x40151F20),
              indent: 15,
              endIndent: 15,
              thickness: .5,
            ),
          ],
        ),
      ));
    }
    Column data = new Column(
      children: children,
    );
    return data;
  }
}