import 'package:app/services/graph_ql_conf.dart';
import 'package:app/services/mutation.dart';
import 'package:app/services/mypaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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

            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(color: MyPaint.getLightGrey()),
              ),
              margin: const EdgeInsets.fromLTRB(0, 10, 5, 0),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 3, 0),
                    child: SvgPicture.network(
                      data['flag'],
                      placeholderBuilder: (context) => CircularProgressIndicator(),
                      width: 30.0,
                    ),
                  ),
                  Text("(+${data['code']})"),
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

  void registrationCompleted(data){

    print(data['register']['token']);

    setState(() {
      savingMode = false;
    });

    //redirect to the page for account verification
    Navigator.pushReplacementNamed(context, "/verify_user", arguments: {"code" : data['register']['token']});

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

                                            SizedBox(height: 30,),
                                            Text(
                                              "By signing up, you agree to HaggleX terms and privacy",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: "basis_grotesque_pro",),
                                            ),
                                            SizedBox(height: 40,),
                                            savingMode ? Center(child: CircularProgressIndicator())
                                                :
                                            Mutation(
                                                options: MutationOptions(
                                                  /// Insert mutation here
                                                  documentNode: gql(QueryMutation().insertUser()),

                                                  /// Tell the GraphQL client to fetch the data from
                                                  /// the network only and don't cache it
                                                  fetchPolicy: FetchPolicy.noCache,

                                                  /// Whenever the [Form] closes, this tells the previous [route]
                                                  /// whether it needs to rebuild itself or not
                                                  onCompleted: (data) => {
                                                    registrationCompleted(data)
                                                  },
                                                ),
                                                builder: (
                                                    RunMutation runMutation,
                                                    QueryResult result,
                                                    ) {

                                                  return FlatButton(
                                                    padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                                                    color: MyPaint.getMainColor(),
                                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),

                                                    onPressed: (){
                                                      if(!_formKey.currentState.validate()){
                                                        return;
                                                      }

                                                      _formKey.currentState.save();

                                                      setState(() {
                                                        savingMode = true;
                                                      });

                                                      runMutation({
                                                        'email': _email,
                                                        'username': _username,
                                                        'password': _password,
                                                        'phonenumber': _phone_number,
                                                        'referralcode': _referral_code,
                                                        'callingcode': data['code'],
                                                        'flag': data['flag'],
                                                        'country': data['country'],
                                                        'currency': data['currency'],
                                                      });

                                                    },

                                                    child: Text(
                                                      "SIGN UP",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: "basis_grotesque_pro",
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  )
                                                  ;
                                                }
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

      ),
    );
  }
}
