import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/vars.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final userPool = new CognitoUserPool(
      DotEnv().env['USER_POOL_ID'],
      DotEnv().env['APP_CLIENT_ID'],
    );
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFF7F3E3),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email'
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password'
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      controller: passwordController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar
                          final cognitoUser = new CognitoUser(emailController.text, userPool);
                          final authDetails = new AuthenticationDetails(
                            username: emailController.text,
                            password: passwordController.text,
                          );
                          cognitoUser.authenticateUser(authDetails).then((session) {
                            print(session.getAccessToken().getJwtToken());
                            SharedPreferences.getInstance().then((prefs) {
                              prefs.setString(tokenName, session.getAccessToken().getJwtToken());
                            }).catchError((err) {
                              print(err);
                            });
                            /*
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            int counter = (prefs.getInt('counter') ?? 0) + 1;
                            print('Pressed $counter times.');
                            await prefs.setInt('counter', counter);
                             */
                          }, onError: (err) {
                            print(err);
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
