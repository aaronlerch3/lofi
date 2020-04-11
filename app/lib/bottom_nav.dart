

import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:lofi/redux/store.dart';
import 'package:lofi/routes.dart';
import 'package:redux/redux.dart';

import 'icons.dart';

class BottomNav extends StatelessWidget {
  int getCurrentIndex(String currentRoute) {
    int currentIndex = Routes.routesList.indexOf(currentRoute);
    if (currentIndex < 0) {
      currentIndex = 0;
    }
    return currentIndex;
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF151F20).withOpacity(1),
          selectedItemColor: Color(0xFFF7F3E3),
          unselectedItemColor: Color(0x80F7F3E3),
          onTap: (newIndex) {
            final String newRoute = Routes.routesList[newIndex];
            vm.changeRoute(newRoute);
          },
          currentIndex: getCurrentIndex(vm.activeRoute), // this will be set when a new tab is tapped
          items: [
            //home
            BottomNavigationBarItem(
              icon: new Icon(CustomIcons.home),
              title: Text('Home', style: TextStyle(fontSize: 11)),
            ),
            //Trending
            BottomNavigationBarItem(
              icon: new Icon(CustomIcons.trending),
              title: const Text('Discover', style: TextStyle(fontSize: 11)),
            ),
            //Community
            BottomNavigationBarItem(
              icon: Icon(Icons.people, size: 28,),
              title: const Text('Community', style: TextStyle(fontSize: 11)),
            ),
            //Shows
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.ticket),
              title: const Text('Shows', style: TextStyle(fontSize: 11)),
            )
          ],
        );
      },
    );
  }
}


class _ViewModel {
  final String activeRoute;
  final Function(String newRoute) changeRoute;

  _ViewModel({
    @required this.activeRoute,
    @required this.changeRoute,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeRoute: store.state.route,
      changeRoute: (String newRoute) {
        store.dispatch(SetRouteAction(newRoute));
      },
    );
  }
}
