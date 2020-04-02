import 'package:lofi/icons.dart';
import 'package:lofi/profile_page/artist_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page/home_page.dart';
import 'package:lofi/trending_page.dart';
import 'community_page/community.dart';
import 'package:lofi/tickets_page/main.dart';
import 'package:lofi/create_account_page/main.dart';
import 'package:lofi/login_page/main.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    Trending(),
    Community(),
    Tickets(),
    // CreateAccountPage(),
    // LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //appBar
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFA2061E)),
        leading: new Icon(CustomIcons.search, size: 28,),
        title: new Icon(
          CustomIcons.logo,
          size: 42,
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(CustomIcons.user, size: 30,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistProfilePage()));
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xF5F7F3E3),
      ),
      body: _children[_currentIndex],
      //bottomNav
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF151F20).withOpacity(1),
        selectedItemColor: Color(0xFFF7F3E3),
        unselectedItemColor: Color(0x80F7F3E3),
        onTap: onTabTapped,
        currentIndex:
        _currentIndex, // this will be set when a new tab is tapped
        items: [
          //home
          BottomNavigationBarItem(
            icon: new Icon(CustomIcons.home),
            title: const Text('Home', style: TextStyle(fontSize: 11)),
          ),
          //Trending
          BottomNavigationBarItem(
            icon: new Icon(CustomIcons.trending),
            title: const Text('Trending', style: TextStyle(fontSize: 11)),
          ),
          //Community
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.community),
            title: const Text('Community', style: TextStyle(fontSize: 11)),
          ),
          //Shows
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.ticket),
            title: const Text('Shows', style: TextStyle(fontSize: 11)),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
