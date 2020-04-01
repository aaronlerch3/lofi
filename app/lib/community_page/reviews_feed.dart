import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/icons.dart';

class ReviewsFeed extends StatefulWidget {
  @override
  _ReviewsFeedState createState() => _ReviewsFeedState();
}

class _ReviewsFeedState extends State<ReviewsFeed> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    List<String> art = new List<String>();
    art.add("images/handheld.jpg");
    art.add("images/songs_for_strangers.jpg");
    art.add("images/handheld.jpg");
    art.add("images/handheld.jpg");
    List<String> title = new List<String>();
    title.add('HANDHELD');
    title.add('SONGS FOR STRANGERS');
    title.add('HANDHELD');
    title.add('HANDHELD');
    List<String> artist = new List<String>();
    artist.add("Phoneboy");
    artist.add("Flycatcher");
    artist.add("Phoneboy");
    artist.add("Phoneboy");
    List<String> user = new List<String>();
    user.add("@snobbydude1");
    user.add("@snobbydude2");
    user.add("@snobbydude1");
    user.add("@snobbydude1");
    List<String> body = new List<String>();
    body.add('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia...');
    body.add('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia...');
    body.add('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia...');
    body.add('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia...');
    List<int> rating = new List<int>();
    rating.add(4);
    for (var i = 0; i < user.length; i++) {
      children.add(Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        art[i],
                        scale: 4.5,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.only(left: 15),
                  padding: EdgeInsets.only(top: 25, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title[i],
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        artist[i],
                        style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Icon(App.lofi_icon_01, color: Color(0xFFA2061E),),
                          Icon(App.lofi_icon_01, color: Color(0xFFA2061E),),
                          Icon(App.lofi_icon_01, color: Color(0xFFA2061E),),
                          Icon(App.lofi_icon_01, color: Color(0xFFA2061E),),
                        ],
                      ),
                      Text(
                        user[i],
                        style:
                        TextStyle(fontSize: 9, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    child: Text(
                      body[i],
                      style: TextStyle(fontSize: 11, fontFamily: 'Monterrat'),
                    ),
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