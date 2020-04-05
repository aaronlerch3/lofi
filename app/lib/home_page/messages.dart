import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/icons.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F3E3),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFF7F3E3)),
        leading: new IconButton(
          icon: Icon(
            CustomIcons.back,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.add, size: 32, color: Color(0xFFF7F3E3))
              //onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistProfilePage()));
              //},
              ),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFC151F20),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
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
                        border: InputBorder.none,
                        hintText: 'Search'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .18,
                  height: MediaQuery.of(context).size.width * .18,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFF7F3E3),
                    foregroundColor: Color(0xFFF7F3E3),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * .245,
                      backgroundImage: AssetImage('images/wyn.jpg'),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "sergscardigs",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                          ),
                          Text(
                            "yo can we write some beekeeper songs tn?",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
