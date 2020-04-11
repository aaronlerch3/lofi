import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lofi/models/user.dart';
import 'package:lofi/redux/user/state.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import '../store.dart';

@immutable
class SetUserStateAction {
  final UserState userState;

  SetUserStateAction(this.userState);
}

final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'profile',
    'email',
    'openid',
  ],
);

final TwitterLogin twitterLogin = new TwitterLogin(
  consumerKey: DotEnv().env['TWITTER_KEY'],
  consumerSecret: DotEnv().env['TWITTER_SECRET'],
);

final facebookLogin = FacebookLogin();

class AuthActions {
  static Future<void> signInGoogle(Store<AppState> store) async {
    User newUser;
    try {
      GoogleSignInAccount account = await googleSignIn.signIn();
      newUser = User.fromGoogle(account);
      account.authentication.then((val) {
        print("token: ${val.idToken}");
      }).catchError((err) {
        print(err);
      });
    } catch (error) {
      print(error);
      store.dispatch(
          SetUserStateAction(UserState(isLoading: false, isError: true, user: null)));
      return;
    }
    store.dispatch(SetUserStateAction(UserState(user: newUser)));
  }

  static Future<void> signInTwitter(Store<AppState> store) async {
    User newUser;
    try {
      final TwitterLoginResult result = await twitterLogin.authorize();
      switch (result.status) {
        case TwitterLoginStatus.loggedIn:
          newUser = User.fromTwitter(result);
          print("token: ${result.session.token}");
          break;
        case TwitterLoginStatus.cancelledByUser:
          return;
        case TwitterLoginStatus.error:
          print(result.errorMessage);
          break;
      }
    } catch (error) {
      print(error);
      store.dispatch(
          SetUserStateAction(UserState(isLoading: false, isError: true, user: null)));
      return;
    }
    store.dispatch(SetUserStateAction(UserState(user: newUser)));
  }

  static Future<void> signInFacebook(Store<AppState> store) async {
    User newUser;
    try {
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        newUser = User.fromFacebook(result);
        print("token: ${result.accessToken.token}");
        break;
      case FacebookLoginStatus.cancelledByUser:
        return;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  } catch (error) {
    print(error);
    store.dispatch(
    SetUserStateAction(UserState(isLoading: false, isError: true, user: null)));
    return;
    }
    store.dispatch(SetUserStateAction(UserState(user: newUser)));
  }

  static Future<void> signOut(Store<AppState> store) async {
    try {
      switch (store.state.userState.user.authType) {
        case AuthTypes.Google:
          await googleSignIn.disconnect();
          break;
        case AuthTypes.Twitter:
          await twitterLogin.logOut();
          break;
        default:
          break;
      }
    } catch (error) {
      store.dispatch(
          SetUserStateAction(UserState(isLoading: false, isError: true)));
    }
    store.dispatch(SetUserStateAction(UserState(user: null)));
  }
}
