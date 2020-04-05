import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/icons.dart';

class NewReleasesGallery extends StatefulWidget {
  @override
  _NewReleasesGalleryState createState() => _NewReleasesGalleryState();
}

class _NewReleasesGalleryState extends State<NewReleasesGallery> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    List<String> images = new List<String>();
    images.add("images/flourish.jpg");
    images.add("images/handheld.jpg");
    images.add("images/service_dog.jpg");
    List<String> album = new List<String>();
    album.add("Flourish");
    album.add("Handheld");
    album.add("Hard Ground");
    List<String> band = new List<String>();
    band.add("Flourish");
    band.add("Phoneboy");
    band.add("Service Dog");
    List<String> playCount = new List<String>();
    playCount.add("1853");
    playCount.add("6421");
    playCount.add("542");
    List<String> comments = new List<String>();
    comments.add("62");
    comments.add("241");
    comments.add("34");
    for (var i = 0; i < images.length; i++) {
      children.add(Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    images[i],
                    scale: 3.9,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 20, bottom: 20),
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    album[i],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Text(band[i], style: TextStyle(fontSize: 18)),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        CustomIcons.play_circled,
                        color: Color(0xFFA2061E),
                        size: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(playCount[i], style: TextStyle(fontSize: 15)),
                      SizedBox(width: 15,),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(
                          CustomIcons.community,
                          color: Color(0xFFA2061E),
                          size: 25,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 6, bottom: 0),
                        child:
                        Text(comments[i], style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                ],
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
