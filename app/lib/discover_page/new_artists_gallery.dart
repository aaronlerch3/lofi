import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/icons.dart';

class NewArtistsGallery extends StatefulWidget {
  @override
  _NewArtistsGalleryState createState() => _NewArtistsGalleryState();
}

class _NewArtistsGalleryState extends State<NewArtistsGallery> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    List<String> image = new List<String>();
    image.add("images/wyn.jpg");
    image.add("images/wyn.jpg");
    image.add("images/wyn.jpg");
    List<String> band = new List<String>();
    band.add("BEEKEEPER");
    band.add("BEHIND THE CURTAIN");
    band.add("THE KATE RATH EXPERIENCE");
    List<String> location = new List<String>();
    location.add("Hoboken, NJ");
    location.add("Hoboken, NJ");
    location.add("Hicksville, NY");
    List<String> distance = new List<String>();
    distance.add("0.1 mi");
    distance.add("0.1 mi");
    distance.add("24.5 mi");
    for (var i = 0; i < image.length; i++) {
      children.add(Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10, bottom: 15),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: Color(0xCCA2061E)),
              ),
              height: 120,
              width: 120,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * .12,
                backgroundImage: AssetImage(image[i]),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .51,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    band[i],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF151F20)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    location[i],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    distance[i],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Column(
              children: <Widget>[
                Icon(
                  CustomIcons.forward,
                  color: Color(0xFFA2061E),
                ),
              ],
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
