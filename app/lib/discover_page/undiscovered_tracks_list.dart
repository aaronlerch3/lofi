import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/icons.dart';

class UndiscoveredTracksList extends StatefulWidget {
  @override
  _UndiscoveredTracksListState createState() => _UndiscoveredTracksListState();
}

class _UndiscoveredTracksListState extends State<UndiscoveredTracksList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    List<String> image = new List<String>();
    image.add("images/flourish.jpg");
    image.add("images/handheld.jpg");
    image.add("images/service_dog.jpg");
    List<String> band = new List<String>();
    band.add("Beekeeper");
    band.add("Behind The Curtain");
    band.add("The Kate Rath Experience");
    List<String> track = new List<String>();
    track.add("Honey");
    track.add("Doors");
    track.add("Hello My Name Is... Kate!");
    List<String> playCount = new List<String>();
    playCount.add("15");
    playCount.add("52");
    playCount.add("3");
    for (var i = 0; i < image.length; i++) {
      children.add(Container(
        width: MediaQuery.of(context).size.width *.433,
        padding: EdgeInsets.only(right: 0, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Image.asset(
                image[i],
                scale: 3.9,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                track[i],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
            ),
            Container(
              child: Text(
                band[i],
                style: TextStyle(fontSize: 14),
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ],
        ),
      ));
    }
    Row data = new Row(
      children: children,
    );
    return data;
  }
}