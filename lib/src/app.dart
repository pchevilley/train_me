import 'package:flutter/material.dart';
import 'ui/login_page/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: LoginPage(),
      );
  }
}