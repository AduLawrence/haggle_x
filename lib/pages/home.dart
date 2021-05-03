import 'package:app/services/graph_ql_conf.dart';
import 'package:app/services/mypaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void logOut() async{
    //log user out
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    //return to login screen
    Navigator.pushReplacementNamed(context, "/login");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GraphQLProvider(
        client: GraphQLConfiguration().client,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/bg.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 50, 40, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Dashboard!",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "basis_grotesque_pro",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 400,),

                  FlatButton(
                    padding: EdgeInsets.fromLTRB(5, 18, 5, 18),
                    color: MyPaint.getYellowColor(),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),

                    onPressed: (){
                      logOut();

                    },

                    child: Text(
                      "LOG OUT",
                      style: TextStyle(
                          color: MyPaint.getMainColor(),
                          fontFamily: "basis_grotesque_pro",
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ),
                ],
              ),
            )
          ),
        ),

      ),

    );
  }
}