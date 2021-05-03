import 'package:app/services/graph_ql_conf.dart';
import 'package:app/services/mutation.dart';
import 'package:app/services/mypaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool savingMode = false; bool _obscureText = true;
  String _email, _password, _username, _referral_code = "", _phone_number;
  Map data;

  Widget _buildEmail(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email Address",
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

  Widget _buildUsername(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Create a username",
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
          return "Username is required";
        }

      },

      onSaved: (String value){
        _username = value;
      },
    );
  }

  Widget _buildReferralCode(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Referral code (Optional)",
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


      onSaved: (String value){
        _referral_code = value;
      },
    );
  }

  Widget _buildPassword(){
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password (Min. 8 characters)",
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
        suffixIcon: IconButton(
          icon: _obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          color: Colors.black,
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

  void registrationCompleted(data){

    print(data['register']['token']);

    setState(() {
      savingMode = false;
    });

    //redirect to the page for account verification
    if(data['register']['token'] != ""){
      Navigator.pushReplacementNamed(context, "/verify_user", arguments: {"code" : data['register']['token']});

    }

  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

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
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  "assets/back1.png",
                                  height: 36,
                                  width: 45,
                                  alignment: Alignment.topLeft,
                                ),
                              ),

                              SizedBox(height: 20,),

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

      ),
    );
  }
}
