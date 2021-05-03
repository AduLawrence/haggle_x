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

  String verifyUser() {

    return """
      mutation verify(\$code: Int!) {
        verifyUser(data: {
          code: \$code      
        }) {          
            token,    
        }
      }
    """;
  }

  String loginUser() {

    return """
      mutation login_user(\$input: String!, \$password: String!) {
        login(data: {
          input: \$input,
          password: \$password       
        }) {          
            token,    
        }
      }
    """;
  }

  String resendVerificationCode() {

    return """
      query verification_code(\$email: String!) {
        resendVerificationCode(data: {
          email: \$email        
        }) 
      }
    """;
  }
}