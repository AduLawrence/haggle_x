import 'package:app/services/mypaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  bool _countryLoading = false;
  List<Map> countries = [{"name" : "Nigeria", "code" : "234", "icon" : "https://media.gettyimages.com/vectors/united-states-rectangle-flat-vector-id1127371674?s=2048x2048"}];


  Widget _buildSearch(){
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Search for country",
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontFamily: "basis_grotesque_pro",
        ),
        fillColor: MyPaint.getSecondColor(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(16),

        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,

        ),
      ),

    );
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      _buildSearch(),
                      Divider(color: MyPaint.getSecondColor(),)
                    ],
                  ),
                ),

                Expanded(
                  flex: 14,
                  child: ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          leading: Image.network(
                            countries[index]['icon'],
                            width: 40,
                          ),
                          title: Text(
                            countries[index]['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "basis_grotesque_pro",
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          onTap: (){

                          },
                        );
                      }
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