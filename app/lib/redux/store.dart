import 'package:lofi/redux/user/actions.dart';
import 'package:lofi/redux/user/state.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../routes.dart';

@immutable
class AppState {
  final bool loading;
  final String route;
  final UserState userState;

  AppState(
      {this.loading,
      this.route,
      this.userState});

  AppState copyWith({
    bool isLoading,
    String route,
    UserState userState,
  }) => AppState(
    loading: loading ?? this.loading,
      route: route ?? this.route,
    userState: userState ?? this.userState,
    );

  factory AppState.initial() => AppState(
      loading: false,
      route: Routes.routesList[0],
      userState: UserState.initial());

  @override
  String toString() {
    return 'AppState{loading: $loading, route: $route}';
  }
}

@immutable
class SetRouteAction {
  final String newRoute;

  SetRouteAction(this.newRoute);
}

AppState appReducer(AppState state, dynamic action) {
  if (action is SetRouteAction) {
    if (Routes.routesList.contains(action.newRoute)) {
      Routes.navigatorKey.currentState.pushNamed(action.newRoute);
      return state.copyWith(route: action.newRoute);
    }
  } else if (action is SetUserStateAction) {
    return state.copyWith(userState: action.userState);
  }
  return state;
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(),
    );
  }
}
