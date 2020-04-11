import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/redux/store.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lofi/redux/user/actions.dart';
import 'package:lofi/redux/user/state.dart';
import 'package:redux/redux.dart';

import 'email_login.dart';

class LoginPage extends StatelessWidget {
  void handleGoogleUserChange(GoogleSignInAccount account) {
    if (account == null)
      return;
    account.authentication.then((val) {
      print(val.idToken);
      print("got token");
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        /*
        googleSignIn.signInSilently().then((account) {
          handleGoogleUserChange(account);
        }).catchError((err) {
          print(err);
        });
        */
        if (vm.userState != null && vm.userState.user != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ListTile(
                title: Text(vm.userState.user.name ?? ''),
                subtitle: Text(vm.userState.user.email ?? ''),
              ),
              RaisedButton(
                child: const Text('SIGN OUT'),
                onPressed: () {
                  vm.signout();
                },
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {
                  vm.signInGoogle();
                },
              ),
              SignInButton(
                Buttons.Twitter,
                onPressed: () {
                  vm.signInTwitter();
                },
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {
                  vm.signInFacebook();
                },
              ),
              SignInButtonBuilder(
                text: 'Sign in with Email',
                icon: Icons.email,
                backgroundColor: Colors.blueGrey[700],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmailLogin()));
                },
                width: 220.0,
              ),
            ],
          );
        }
      }
    );
  }
}

class _ViewModel {
  final String activeRoute;
  final Future Function() signout;
  final Future Function() signInGoogle;
  final Future Function() signInTwitter;
  final Future Function() signInFacebook;
  final UserState userState;

  _ViewModel({
    @required this.activeRoute,
    @required this.signout,
    @required this.userState,
    @required this.signInGoogle,
    @required this.signInTwitter,
    @required this.signInFacebook,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeRoute: store.state.route,
      signout: () => store.dispatch(AuthActions.signOut),
      userState: store.state.userState,
      signInGoogle: () => store.dispatch(AuthActions.signInGoogle),
      signInTwitter: () => store.dispatch(AuthActions.signInTwitter),
      signInFacebook: () => store.dispatch(AuthActions.signInFacebook),
    );
  }
}
