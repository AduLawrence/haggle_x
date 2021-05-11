import 'package:app/services/mypaint.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: CustomScrollView(
        slivers: <Widget>[
      SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            decoration: BoxDecoration(
              color: MyPaint.getLightGrey(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: MyPaint.getMainColor(),
                  ),
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 50, 25, 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: MyPaint.getMainColor(),
                                borderRadius: BorderRadius.circular(20),
                                border: Border(
                                  left: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                      ),
                                  top: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  right: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),

                                ),
                              ),
                              padding: const EdgeInsets.all(3),
                              height: 40,
                              width: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: MyPaint.getPinkColor(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "SV",
                                    style: TextStyle(
                                      color: MyPaint.getMainColor(),
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ),
                            Text(
                              "HaggleX",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "basis_grotesque_pro",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            new Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getFaded(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(0),
                                  height: 35,
                                  width: 35,
                                  child: new IconButton(
                                      iconSize: 20,
                                      icon: Icon(Icons.notifications),
                                      color: Colors.white,
                                      onPressed: () {}
                                      ),
                                ),
                                new Positioned(
                                  right: 0,
                                  top: 0,
                                  child: new Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: new BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    constraints: BoxConstraints(
                                      minWidth: 14,
                                      minHeight: 14,
                                    ),
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text(
                          "Total portfolio balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "basis_grotesque_pro",
                            fontWeight: FontWeight.normal,
                            fontSize: 9,
                            letterSpacing: 0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$****",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "basis_grotesque_pro",
                                fontWeight: FontWeight.normal,
                                fontSize: 25,
                                letterSpacing: 0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.fromLTRB(5,3,5,3),
                                height: 40,
                                width: 89,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: MyPaint.getYellowColor(),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 27,
                                      width: 38,
                                      child: Center(
                                        child: Text(
                                          "USD",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 6,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 27,
                                      width: 38,
                                      child: Center(
                                        child: Text(
                                          "NGN",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 6,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/otc.png",
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Markets",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "basis_grotesque_pro",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/hg.png",
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Haggle (HAG)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "NGN 380",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 9,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/grp1.png",
                              height: 22,
                            ),
                          ],
                        ),
                        Divider(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getLightGrey2(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,

                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: MyPaint.getYellowColor(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(5,3,5,3),
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                        CryptoFontIcons.BTC,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bitcoin (BTC)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "NGN 4,272,147.00",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "+2.34%",
                                          style: TextStyle(
                                            color: MyPaint.getGreenColor(),
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/grp2.png",
                              height: 22,
                            ),
                          ],
                        ),
                        Divider(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getLightGrey2(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,

                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(5,3,5,3),
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                      CryptoFontIcons.ETH,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ethereum (ETH)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "NGN 4,272,147.00",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "+2.34%",
                                          style: TextStyle(
                                            color: MyPaint.getGreenColor(),
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/grp3.png",
                              height: 22,
                            ),
                          ],
                        ),
                        Divider(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getLightGrey2(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,

                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: MyPaint.getTether(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(5,3,5,3),
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                      CryptoFontIcons.USDT,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tether (USDT)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "NGN 4,272,147.00",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "+2.34%",
                                          style: TextStyle(
                                            color: MyPaint.getGreenColor(),
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/grp4.png",
                              height: 22,
                            ),
                          ],
                        ),
                        Divider(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getLightGrey2(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,

                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: MyPaint.getBCH(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(5,3,5,3),
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                      CryptoFontIcons.BTC,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bitcoin Cash (BCH)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "NGN 4,272,147.00",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "+2.34%",
                                          style: TextStyle(
                                            color: MyPaint.getGreenColor(),
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/grp5.png",
                              height: 22,
                            ),
                          ],
                        ),
                        Divider(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getLightGrey2(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,

                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: MyPaint.getDodge(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(5,3,5,3),
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                      CryptoFontIcons.DOGE,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dodgecoin (DOGE)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "NGN 4,272,147.00",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "+2.34%",
                                          style: TextStyle(
                                            color: MyPaint.getGreenColor(),
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/grp6.png",
                              height: 22,
                            ),
                          ],
                        ),
                        Divider(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getLightGrey2(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,

                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: MyPaint.getLTC(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(5,3,5,3),
                                    height: 35,
                                    width: 35,
                                    child: Icon(
                                      CryptoFontIcons.LTC,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Litecoin (LTC)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "NGN 4,272,147.00",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "+2.34%",
                                          style: TextStyle(
                                            color: MyPaint.getGreenColor(),
                                            fontFamily: "basis_grotesque_pro",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/grp7.png",
                              height: 22,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Do more with HaggleX",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "basis_grotesque_pro",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: MyPaint.getGreyColorWithOpacity(),
                                spreadRadius: 3,
                                blurRadius: 14,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(14),
                          height: 72,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icon1.png",
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Send money instantly",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Send crypto to another wallet",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 9,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: MyPaint.getGreyColorWithOpacity(),
                                spreadRadius: 3,
                                blurRadius: 14,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(14),
                          height: 72,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: MyPaint.getCircleColor(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(5),
                                height: 40,
                                width: 40,

                                child: Image.asset(
                                  "assets/icon2.png",
                                  height: 40,
                                  width: 40,
                                )
                              ),

                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Receive money from anyone",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Receive crypto from another wallet",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 9,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: MyPaint.getGreyColorWithOpacity(),
                                spreadRadius: 3,
                                blurRadius: 14,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(14),
                          height: 72,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getCircleColor(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,

                                  child: Icon(
                                    Icons.credit_card_sharp,
                                    color: MyPaint.getMainColor(),
                                  )
                              ),

                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Virtual Card",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Send money to anyone, anywhere",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 9,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: MyPaint.getGreyColorWithOpacity(),
                                spreadRadius: 3,
                                blurRadius: 14,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(14),
                          height: 72,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: MyPaint.getCircleColor(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,

                                  child: Icon(
                                    Icons.circle,
                                    color: MyPaint.getMainColor(),
                                  )
                              ),

                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Global Remittance",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Send money to anyone, anywhere",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 9,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trending crypto news",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "basis_grotesque_pro",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Image.asset(
                              "assets/new.png",
                              height: 57,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "6hrs ago",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      "Category: ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "DeFi",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Image.asset(
                              "assets/new.png",
                              height: 57,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "6hrs ago",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      "Category: ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "DeFi",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Image.asset(
                              "assets/new.png",
                              height: 57,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "6hrs ago",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      "Category: ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "DeFi",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Image.asset(
                              "assets/new.png",
                              height: 57,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "6hrs ago",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      "Category: ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "DeFi",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Image.asset(
                              "assets/new.png",
                              height: 57,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "basis_grotesque_pro",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      letterSpacing: 0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "6hrs ago",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      "Category: ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "DeFi",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "View all stories",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "basis_grotesque_pro",
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            letterSpacing: 0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Icon(
                          Icons.navigate_next
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          )
        ]
        )
      )
      ]

    ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey.shade500,
          currentIndex: 0,
          onTap: (index) {

          },
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                "assets/nav1.png",
                height: 60,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                "assets/nav2.png",
                height: 60,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                "assets/nav3.png",
                height: 60,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                "assets/nav4.png",
                height: 60,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                "assets/nav5.png",
                height: 60,
              ),
            ),
          ],
        )
    );
  }
}