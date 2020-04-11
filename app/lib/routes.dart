import 'package:lofi/home_page/home_page.dart';
import 'package:lofi/shows_page/shows_page.dart';
import 'package:lofi/discover_page/discover_page.dart';
import 'package:lofi/community_page/community.dart';
import 'package:lofi/login_page/login_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String home = "/";
  static const String discover = "/discover";
  static const String community = "/community";
  static const String shows = "/shows";

  static final pagesRouteFactories = {
    Routes.home: () => MaterialPageRoute(
      builder: (context) => HomePage(),
    ),
    Routes.discover: () => MaterialPageRoute(
      builder: (context) => Discover(),
    ),
    Routes.community: () => MaterialPageRoute(
      builder: (context) => Community(),
    ),
    Routes.shows: () => MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  };

  static final routesList = pagesRouteFactories.keys.toList();
}
