import 'dart:io';
import 'package:app/services/mypaint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loadNewScreen(){

}

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool loggedIn = false;
  String user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    getLoginDetails();

    Future.delayed(Duration(seconds: 10), () async{
      if(loggedIn) {
        Navigator.pushReplacementNamed(context, "/home");
      }else {
        Navigator.pushReplacementNamed(context, "/login");
      }

    });
  }

  void getLoginDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getKeys().contains("user")){
      loggedIn = true;
      user = prefs.getString("user");
    }else{
      loggedIn = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/bg.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/icon_white.png",
                            width: 150,
                          ),
                        ],
                      ),
                      Text(
                        "HaggleX",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "basis_grotesque_pro",
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          letterSpacing: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



