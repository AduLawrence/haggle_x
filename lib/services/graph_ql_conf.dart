import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  //the url
  static HttpLink httpLink = HttpLink(
    uri: "https://hagglex-backend-staging.herokuapp.com/graphql",
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );


  //with authorization
  ValueNotifier<GraphQLClient> getClientAuth(code){
    HttpLink httpLinkAuth = HttpLink(
        uri: "https://hagglex-backend-staging.herokuapp.com/graphql",
        headers: {
          "authorization" : "Bearer $code"
        }
    );

    ValueNotifier<GraphQLClient> clientAuth = ValueNotifier(
      GraphQLClient(
        link: httpLinkAuth,
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      ),
    );


    return clientAuth;

  }

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}