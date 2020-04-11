import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lofi/home_page/home_page.dart';
import 'package:lofi/redux/store.dart';
import 'package:lofi/routes.dart';

import 'community_page/community.dart';
import 'discover_page/discover_page.dart';
import 'layout.dart';
import 'login_page/login_page.dart';

Future main() async {
  await DotEnv().load('.env');
  // https://github.com/brianegan/flutter_architecture_samples/tree/master/redux
  await Redux.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Redux.store,
      child: MaterialApp(
        title: 'LOFI',
        theme: ThemeData(fontFamily: 'Montserrat'),
        navigatorKey: Routes.navigatorKey,
        routes: {
          Routes.home: (context) => Layout(child: HomePage()),
          Routes.discover: (context) => Layout(child: Discover()),
          Routes.community: (context) => Layout(child: Community()),
          Routes.shows: (context) => Layout(child: LoginPage()),
        },
        /*
        home: Layout(
          child: MaterialApp(
              theme: ThemeData(pageTransitionsTheme: PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  }
              )),
              navigatorKey: Routes.navigatorKey,
              onGenerateRoute: (route) => Routes.pagesRouteFactories[route.name]()
          ),
        )
         */
      ),
    );
  }
}
