import 'package:app/services/mypaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool showButtons = true; bool showProgress = false; bool _obscureText = true;
  String _email, _password;

  Widget _buildEmail(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email Address",
        labelStyle: TextStyle(
            color: Colors.white
        ),
        fillColor: Colors.white,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),

      ),


      validator: (String value){
        if(value.isEmpty){
          return "Email is required";
        }

        if(!RegExp(pattern).hasMatch(value)){
          return "Enter a valid email address";
        }

      },

      onSaved: (String value){
        _email = value;
      },
    );
  }

  Widget _buildPassword(){
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password (Min. 8 characters)",
        labelStyle: TextStyle(
            color: Colors.white
        ),
        fillColor: Colors.white,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: IconButton(
          icon: _obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          color: Colors.white,
          onPressed: (){
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      obscureText: _obscureText,
      validator: (String value){
        if(value.isEmpty){
          return "Password is required";
        }

        if(value.length < 8){
          return "Password minimum length allowed is 8";
        }
      },

      onSaved: (String value){
        _password = value;
      },
    );
  }

  void submitUserDetails() async{


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
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 50, 40, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              "Welcome!",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "basis_grotesque_pro",
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                letterSpacing: 0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  SizedBox(height: 40,),
                                  _buildEmail(),
                                  SizedBox(height: 20,),
                                  _buildPassword(),
                                  SizedBox(height: 20,),
                                  Visibility(
                                    visible: showProgress,
                                    child: SpinKitDoubleBounce(
                                      color: MyPaint.getMainColor(),
                                      size: 50.0,
                                    ),
                                  ),
                                  Visibility(
                                    visible: showButtons,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                              },
                                              splashColor: Colors.white,
                                              child: Text(
                                                "Forgot Password?",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: "basis_grotesque_pro",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 40,),

                                        FlatButton(
                                          padding: EdgeInsets.fromLTRB(5, 18, 5, 18),
                                          color: MyPaint.getYellowColor(),
                                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),

                                          onPressed: (){
                                            if(!_formKey.currentState.validate()){
                                              return;
                                            }

                                            _formKey.currentState.save();

                                            setState(() {
                                              showProgress = true;
                                              showButtons = false;
                                            });

                                            submitUserDetails();

                                          },

                                          child: Text(
                                            "LOG IN",
                                            style: TextStyle(
                                              color: MyPaint.getMainColor(),
                                              fontFamily: "basis_grotesque_pro",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),

                                        FlatButton(
                                          padding: EdgeInsets.fromLTRB(5, 14, 5, 14),

                                          onPressed: (){
                                            Navigator.pushNamed(context, "/register");
                                          },
                                          child: Text(
                                            "New User? Create a new account",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "basis_grotesque_pro",
                                            ),
                                          )  ,
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}