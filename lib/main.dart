import 'package:app/pages/countries.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/register.dart';
import 'package:app/pages/select_country.dart';
import 'package:app/pages/splash.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'Circular'
    ),

    title: "HaggleX",
    initialRoute: "/",
    routes: {
      "/" : (context) => Splash(),
      "/login" : (context) => Login(),
      "/register" : (context) => Register(),
      "/select_country" : (context) => Countries(),

    },

  ));
}