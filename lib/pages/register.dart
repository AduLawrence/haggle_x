import 'package:app/services/mypaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool showButtons = true; bool showProgress = false; bool _obscureText = true, _countryLoading = false;
  String _email, _password, _username, _referral_code, _phone_number;

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

  Widget _buildPhoneNumber(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Enter your phone number",
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
          return "Phone number is required";
        }

      },

      onSaved: (String value){
        _phone_number = value;
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

  Widget _buildPhone(){
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/select_country");
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(color: MyPaint.getLightGrey()),
              ),
              margin: const EdgeInsets.fromLTRB(0, 10, 5, 0),
              padding: const EdgeInsets.all(5),
              child: _countryLoading ? Icon(Icons.autorenew, color: Colors.grey,) : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 3, 0),
                    child: Image.asset(
                      "assets/back1.png",
                      height: 30,
                      width: 30,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Text("(+234)"),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: _buildPhoneNumber(),
        ),
      ],
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
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Create a new account",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "basis_grotesque_pro",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
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
                                          SizedBox(height: 30,),
                                          _buildPassword(),
                                          SizedBox(height: 30,),
                                          _buildUsername(),
                                          SizedBox(height: 30,),
                                          _buildPhone(),
                                          SizedBox(height: 30,),
                                          _buildReferralCode(),
                                          Visibility(
                                            visible: showProgress,
                                            child: SpinKitDoubleBounce(
                                              color: MyPaint.getMainColor(),
                                              size: 50.0,
                                            ),
                                          ),

                                          SizedBox(height: 30,),

                                          Visibility(
                                            visible: showButtons,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: (){
                                                  },
                                                  splashColor: Colors.white,
                                                  child: Text(
                                                    "By signing up, you agree to HaggleX terms and privacy",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontFamily: "basis_grotesque_pro",),
                                                  ),
                                                ),
                                                SizedBox(height: 40,),

                                                FlatButton(
                                                  padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                                                  color: MyPaint.getMainColor(),
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
                                                    "SIGN UP",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "basis_grotesque_pro",
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
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