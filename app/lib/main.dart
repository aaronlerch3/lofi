import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
import 'navigation.dart';

Future main() async {
  await DotEnv().load('.env');
  // https://github.com/brianegan/flutter_architecture_samples/tree/master/redux
  // final store = new Store<int>(counterReducer, initialState: 0);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOFI',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Navigation(),
    );
  }
}
