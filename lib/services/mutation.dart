class QueryMutation {
  String insertUser() {

    return """
      mutation register(\$email: String!, \$username: String!, \$password: String!, \$phonenumber: String!,
                        \$referralcode: String!,
                        \$callingcode: String!,
                        \$flag: String!,
                        \$country: String!,
                        \$currency: String!) {
        register(data: {
          email: \$email,
          username: \$username,
          password: \$password,
          phonenumber: \$phonenumber,
          referralCode: \$referralcode,
          phoneNumberDetails: {
            phoneNumber: \$phonenumber,
            callingCode: \$callingcode,
            flag: \$flag,
          }
          country: \$country,
          currency: \$currency,          
        }) {          
            token,    
        }
      }
    """;
  }

}