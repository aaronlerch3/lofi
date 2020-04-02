import 'package:lofi/community_page/discussion_feed.dart';
import 'package:lofi/home_page/new_releases_gallery.dart';
import 'package:lofi/home_page/shows_near_you_list.dart';
import 'package:lofi/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/home_page/top_tracks_gallery.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10),
        children: <Widget>[
          //Top Tracks Title
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 90, bottom: 10),
                padding: EdgeInsets.only(left: 15, right: 10),
                alignment: Alignment.centerLeft,
                height: 25,
                child: Column(
                  children: <Widget>[
                    Text(
                      'TOP TRACKS NOW',
                      style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //Top Tracks
          Container(
            height: MediaQuery.of(context).size.height * .282,
            margin: EdgeInsets.only(left: 0, bottom: 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TopTracksGallery(),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15, right: 10),
                margin: EdgeInsets.only(top: 13, bottom: 5),
                child: Column(
                  children: <Widget>[
                    Text(
                      'NEW RELEASES',
                      style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                NewReleasesGallery()
              ],
            ),
          ),
          //Shows Near You
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                  child: Column(
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF151F20)
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'SHOWS NEAR YOU',
                                style: TextStyle(
                                    color: Color(0xFFF7F3E3),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              ShowsNearYouList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          DiscussionFeed(),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/songs_for_strangers.jpg',
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
                      'SONGS FOR STRANGERS',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Flycatcher',
                      style:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Icon(
                          App.lofi_app_icons_ticket,
                          color: Color(0xFFA2061E),
                        ),
                        Icon(
                          App.lofi_app_icons_ticket,
                          color: Color(0xFFA2061E),
                        ),
                        Icon(
                          App.lofi_app_icons_ticket,
                          color: Color(0xFFA2061E),
                        ),
                        Icon(
                          App.lofi_app_icons_ticket,
                          color: Color(0xFFA2061E),
                        ),
                      ],
                    ),
                    Text(
                      '@music_reviewer6',
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
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia...',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xFFF7F3E3),
    );
  }
}
