import 'package:http/http.dart' as http;
import 'dart:convert';
class ListVerifyUser{

 static Future<http.Response> postVote(String email, String password) async{
    final response = await http.post(Uri.parse("https://www.votechain.online/user/verifyUser"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,

        }),
        encoding: utf8
    );
    print("este es el estatuscode");
    print(response.statusCode);

    if(response == int)print("La cuenta existe");
    return response;
  }
}
