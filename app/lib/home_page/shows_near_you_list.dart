import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/icons.dart';

class ShowsNearYouList extends StatefulWidget {
  @override
  _ShowsNearYouListState createState() => _ShowsNearYouListState();
}

class _ShowsNearYouListState extends State<ShowsNearYouList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    List<String> month = new List<String>();
    month.add("MAR");
    month.add("MAR");
    month.add("MAR");
    month.add("MAR");
    month.add("MAR");
    List<String> day = new List<String>();
    day.add("15");
    day.add("15");
    day.add("16");
    day.add("16");
    day.add("17");
    List<String> band = new List<String>();
    band.add("Goose Ranger");
    band.add("Behind The Curtain");
    band.add("Flycatcher");
    band.add("typopro");
    band.add("Phoneboy");
    List<String> venue = new List<String>();
    venue.add("Moms House");
    venue.add("8th Street Tavern");
    venue.add("4333 Showcase");
    venue.add("1140 Garden");
    venue.add("Black Rail Coffee");
    for (var i = 0; i < band.length; i++) {
      children.add(Container(
        margin: EdgeInsets.only(top: 17),
        child: Row(
          //Event 1
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(month[i],
                      style: TextStyle(
                          color: Color(0xFFF7F3E3),
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(
                    day[i],
                    style: TextStyle(
                        color: Color(0xFFF7F3E3),
                        fontSize: 26,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(band[i],
                    style: TextStyle(
                        color: Color(0xFFF7F3E3), fontSize: 18.5, fontWeight: FontWeight.w600)),
                Text(
                  venue[i],
                  style: TextStyle(
                      color: Color(0xFFF7F3E3),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Icon(
                    CustomIcons.forward,
                    color: Color(0x80F7F3E3),
                  )
                ],
              ),
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
