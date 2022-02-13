// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wemove_cart/viewmodels/cartViewModel.dart';
import 'package:provider/provider.dart';
import 'views/screens/cartView.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartViewModel(),
    child: MyApp(),
  ));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColorDark: Color.fromARGB(255, 18, 11, 99),
        primaryColor: Color.fromARGB(255, 30, 12, 221),
        primaryColorLight: Color.fromARGB(255, 100, 114, 175),

        // Define the default font family.
        fontFamily: 'Open sans',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CartView(),
    );
  }
}
