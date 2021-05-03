import 'package:app/services/graph_ql_conf.dart';
import 'package:app/services/mutation.dart';
import 'package:app/services/mypaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class VerifyUser extends StatefulWidget {
  @override
  _VerifyUserState createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool savingMode = false; String _token; bool verifying = false;
  int _verificationCode; String _vc_text = "Resend Code";
  Map sentData;

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

    //redirect to the success page
    if(data != null){
      Navigator.pushReplacementNamed(context, "/success", arguments: {"code" : data['verifyUser']['token']});
    }

    setState(() {
      savingMode = false;
    });

  }

  void resendVCDone(data){
//    print(data);

    verifying = false;

    //check if the code was sent
    if(data != null || data != "null"){

      setState(() {
        _vc_text = "Code Sent!";
      });

      Future.delayed(Duration(seconds: 10), () async{
        setState(() {
          _vc_text = "Resend Code";
        });

      });
    }else{

      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    sentData = ModalRoute.of(context).settings.arguments;
    _token = sentData['code'];


    return Scaffold(
      body: GraphQLProvider(
        client: GraphQLConfiguration().getClientAuth(_token),
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

                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
                                child: Text(
                                  "Verify your account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "basis_grotesque_pro",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                    letterSpacing: 0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),

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

                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                                              child: Image.asset(
                                                "assets/verify.png",
                                                width: 70,
                                                height: 70,
                                              ),
                                            ),
                                            Text(
                                              "We just sent a verification code to your email. Please enter the code",
                                              style: TextStyle(
                                                fontFamily: "basis_grotesque_pro",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                letterSpacing: 0,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 30,),
                                            _buildVerificationCode(),

                                            SizedBox(height: 30,),

                                            savingMode ? Center(child: CircularProgressIndicator())
                                                :
                                            Mutation(
                                                options: MutationOptions(
                                                  /// Insert mutation here
                                                  documentNode: gql(QueryMutation().verifyUser()),

                                                  /// Tell the GraphQL client to fetch the data from
                                                  /// the network only and don't cache it
                                                  fetchPolicy: FetchPolicy.noCache,

                                                  /// Whenever the [Form] closes, this tells the previous [route]
                                                  /// whether it needs to rebuild itself or not
                                                  onCompleted: (data) => {
                                                    verificationDone(data)
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
                                                        'code': _verificationCode,
                                                      });

                                                    },

                                                    child: Text(
                                                      "VERIFY ME",
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


                                            SizedBox(height: 40,),

                                            Text(
                                              "This code will expire in 10 minutes",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontFamily: "basis_grotesque_pro",),
                                              textAlign: TextAlign.center,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                              child: verifying ? Center(child: CircularProgressIndicator())
                                                  :
                                              Mutation(
                                                  options: MutationOptions(
                                                    /// Insert mutation here
                                                    documentNode: gql(QueryMutation().resendVerificationCode()),

                                                    /// Tell the GraphQL client to fetch the data from
                                                    /// the network only and don't cache it
                                                    fetchPolicy: FetchPolicy.noCache,

                                                    /// Whenever the [Form] closes, this tells the previous [route]
                                                    /// whether it needs to rebuild itself or not
                                                    onCompleted: (data) => {
                                                      resendVCDone(data)
                                                    },
                                                  ),
                                                  builder: (
                                                      RunMutation runMutation,
                                                      QueryResult result,
                                                      ) {

                                                    return InkWell(
                                                      onTap: (){
                                                        setState(() {
                                                          verifying = true;
                                                        });
                                                        runMutation({
                                                          'email': sentData['email'],
                                                        });
                                                      },

                                                      child: Text(
                                                        "$_vc_text",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontFamily: "basis_grotesque_pro",
                                                          fontWeight: FontWeight.bold,
                                                          decoration: TextDecoration.underline,

                                                        ),

                                                        textAlign: TextAlign.center,
                                                      ),
                                                    );

                                                  }
                                              )

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
