import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTracksGallery extends StatefulWidget {
  @override
  _TopTracksGalleryState createState() => _TopTracksGalleryState();
}

class _TopTracksGalleryState extends State<TopTracksGallery> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    List<String> images = new List<String>();
    images.add("images/service_dog.jpg");
    images.add("images/songs_for_strangers.jpg");
    images.add("images/handheld.jpg");
    images.add("images/songs_for_strangers.jpg");
    images.add("images/handheld.jpg");
    List<String> track = new List<String>();
    track.add("Hard Ground");
    track.add("Songs For Strangers");
    track.add("Handheld");
    track.add("Songs For Strangers");
    track.add("Handheld");
    List<String> band = new List<String>();
    band.add("Service Dog");
    band.add("Flycatcher");
    band.add("Phoneboy");
    band.add("Flycatcher");
    band.add("Phoneboy");
    for (var i = 0; i < images.length; i++) {
      children.add(Container(
        padding: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 6,
            ),
            Image.asset(
              images[i],
              scale: 5.2,
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            Text(
              track[i],
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              band[i],
              style: TextStyle(fontSize: 9),
            ),
            Spacer(
              flex: 10,
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
