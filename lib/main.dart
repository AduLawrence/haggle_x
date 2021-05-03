import 'package:app/pages/countries.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/register.dart';
import 'package:app/pages/splash.dart';
import 'package:app/pages/success.dart';
import 'package:app/pages/verify_user.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(

    title: "HaggleX",
    initialRoute: "/",
    routes: {
      "/" : (context) => Splash(),
      "/login" : (context) => Login(),
      "/register" : (context) => Register(),
      "/select_country" : (context) => Countries(),
      "/verify_user" : (context) => VerifyUser(),
      "/success" : (context) => Success(),
      "/home" : (context) => Home()
    },

  ));
}