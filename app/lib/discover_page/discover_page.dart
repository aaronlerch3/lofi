import 'package:lofi/discover_page/new_artists_gallery.dart';
import 'package:lofi/discover_page/undiscovered_tracks_list.dart';
import 'package:lofi/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(-300, 350);

    path.quadraticBezierTo(size.width * .5, 215, size.width, 0);
    path.lineTo(size.width, 625);
    path.quadraticBezierTo(-size.width * .001, 620, 0, 665);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.search),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  padding: EdgeInsets.only(left: 15),
                  width: MediaQuery.of(context).size.width * .8,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0x1A151F20),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search'),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width * .053,
                      child: Text(
                        'IN THE',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: MediaQuery.of(context).size.width * .053,
                      child: Text(
                        'SPOTLIGHT',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      ),
                    ),
                    ClipPath(
                      clipper: BackgroundClipper(),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 696,
                        decoration: BoxDecoration(
                          color: Color(0xFF151F20),
                        ),
                      ),
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      top: 90,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * .55,
                                height: MediaQuery.of(context).size.width * .55,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFFF7F3E3),
                                  foregroundColor: Color(0xFFF7F3E3),
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width *
                                        .245,
                                    backgroundImage:
                                        AssetImage('images/wyn.jpg'),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 25),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      CustomIcons.pin,
                                      color: Color(0xFFF7F3E3),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text('Hoboken, NJ',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFFF7F3E3))),
                                          Text(
                                            '0.1 mi.',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xFFF7F3E3)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'PHONEBOY',
                                      style: TextStyle(
                                          color: Color(0xFFF7F3E3),
                                          fontSize: 42,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                      width: 102,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFA2061E),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'INDIE POP',
                                            style: TextStyle(
                                                color: Color(0xFFF7F3E3),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                width: MediaQuery.of(context).size.width * .28,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      CustomIcons.trending,
                                      color: Color(0xFFF7F3E3),
                                    ),
                                    Spacer(),
                                    Text('1987',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFF7F3E3),
                                            fontWeight: FontWeight.w300)),
                                    Spacer(),
                                    Icon(
                                      CustomIcons.play_circled,
                                      color: Color(0xFFF7F3E3),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      CustomIcons.ticket,
                                      color: Color(0xFFF7F3E3),
                                    ),
                                    Spacer(),
                                    Text(
                                      '3.17 @ Black Rail Coffee',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFF7F3E3),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            width: MediaQuery.of(context).size.width * .92,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFFF7F3E3),
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height: 110,
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15, top: 5, bottom: 5),
                                    child: Text(
                                      'Ricky Dana, hailing from New Jersey and James Fusco and Wyn Barnum hailing from California combine forces on Phoneboy, an indie-pop force to be reckoned with. Blending mellow indie-pop and hypnagogic-pop roots with their punk and progressive rock oh no my undies are utterly soiled I think im going to ahhhhh',
                                      style: TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.fade,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'UNDISCOVERED TRACKS',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFA2061E)),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .282,
            margin: EdgeInsets.only(left: 0, bottom: 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                UndiscoveredTracksList(),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'NEW ARTISTS',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFA2061E)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: NewArtistsGallery(),
          ),
        ],
      ),
      backgroundColor: Color(0xFFF7F3E3),
    );
  }
}
