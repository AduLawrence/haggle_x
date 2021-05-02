import 'package:app/services/graph_ql_conf.dart';
import 'package:app/services/mypaint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Countries extends StatefulWidget {
  @override
  _Countries createState() => _Countries();
}

class _Countries  extends State<Countries> {


  Widget build(BuildContext context) {
    return GraphQLProvider(
      child: GetCountries(),
      client: GraphQLConfiguration().client,
    );
  }
}

class GetCountries extends StatelessWidget {

  final String query = r"""
                          query{
                            getActiveCountries{
                              name
                              flag
                              callingCode   
                              currencyCode                            
                            }
                          }
                      """;


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
                    child:
                    Query(
                      options: QueryOptions(documentNode: gql(query)),
                      builder: (
                          QueryResult result, {
                            VoidCallback refetch,
                            FetchMore fetchMore,
                          }) {
                        if(result.loading) {
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          );
                        }
                        if (result.data == null) {
                          return Text("No Data Found !");
                        }
                        return ListView.builder(
                            itemCount: result.data['getActiveCountries'].length,
                            itemBuilder: (context, int index) {
                              return ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: SvgPicture.network(
                                    result.data['getActiveCountries'][index]['flag'],
                                    placeholderBuilder: (context) => CircularProgressIndicator(),
                                    width: 35.0,
                                  ),
                                ),

                                title: Text(
                                  "(+${result.data['getActiveCountries'][index]['callingCode']}) ${result.data['getActiveCountries'][index]['name']}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "basis_grotesque_pro",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, "/register", arguments: {"code" : result.data['getActiveCountries'][index]['callingCode'], "flag" : result.data['getActiveCountries'][index]['flag'], "country" : result.data['getActiveCountries'][index]['name'], "currency" : result.data['getActiveCountries'][index]['currencyCode']});
                                },
                              );
                            }
                        );
                      },
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