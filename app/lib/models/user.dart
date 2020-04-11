import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthTypes { Google, Facebook, Twitter }

class User {
  String id;
  AuthTypes authType;
  String name;
  String email;

  User.fromGoogle(GoogleSignInAccount account) {
    if (account == null) return;
    id = '';
    authType = AuthTypes.Google;
    name = account.displayName;
    email = account.email;
  }

  User.fromTwitter(TwitterLoginResult loginRes) {
    if (loginRes == null) return;
    id = '';
    authType = AuthTypes.Twitter;
    name = loginRes.session.username;
    email = '';
  }

  User.fromFacebook(FacebookLoginResult loginRes) {
    if (loginRes == null) return;
    id = '';
    authType = AuthTypes.Facebook;
    name = 'no name';
    email = '';
  }
}
