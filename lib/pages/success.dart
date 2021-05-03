import 'package:app/services/graph_ql_conf.dart';
import 'package:app/services/mutation.dart';
import 'package:app/services/mypaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool savingMode = false; String _token;
  int _verificationCode;
  Map data;

  Widget _buildVerificationCode(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Verification Code",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: "basis_grotesque_pro",
        ),
        fillColor: Colors.black,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),

      ),


      validator: (String value){
        if(value.isEmpty){
          return "Verification code is required";
        }
      },

      onSaved: (String value){
        _verificationCode = int.parse(value);
      },
    );
  }

  void verificationDone(data){
//    print(data['verifyUser']['token']);

    setState(() {
      savingMode = false;
    });

    //redirect to the success page
    if(data['verifyUser']['token'] != ""){
      Navigator.pushReplacementNamed(context, "/success", arguments: {"code" : data['verifyUser']['token']});
    }

  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;


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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 60),

                Image.asset(
                  "assets/success.png",
                  width: 70,
                  height: 70,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    "Setup Complete",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "basis_grotesque_pro",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Text(
                  "Thank you for setting up your HaggleX account",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "basis_grotesque_pro",
                    fontWeight: FontWeight.normal,
                    fontSize: 9,
                    letterSpacing: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 300,),

                FlatButton(
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  color: MyPaint.getYellowColor(),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),

                  onPressed: (){
                    Navigator.pop(context);
                  },

                  child: Text(
                    "START EXPLORING",
                    style: TextStyle(
                        color: MyPaint.getMainColor(),
                        fontFamily: "basis_grotesque_pro",
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
