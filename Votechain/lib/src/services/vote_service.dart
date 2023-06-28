import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class ListVoteService{

  Future<http.Response> postVote(int studentId, int politicalPartyId) async{
print("ejecutando api voto");
    final response = await http.post(Uri.parse("https://www.votechain.online/student/$studentId/politicalpartyparticipant/$politicalPartyId"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "studentId": studentId,
          "politicalPartyId": politicalPartyId,

        }),
        encoding: utf8
    );
    print("este es el estatuscode");
    print(response.statusCode);
    return response;
  }

 Future<http.Response> codeVerification(int code) async{

    final prefs = await SharedPreferences.getInstance();
    final emails= prefs.getString('email')!;
    await prefs.setInt('codeVerification', code);
    final response = await http.post(Uri.parse("https://votechain.online/emails/send"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "emailRecipient": emails,
          "subject": "string",
          "code": code,
          "nameRecipient": "string"
        }),
        encoding: utf8
    );
    print("este es el estatuscode");
    print(response.statusCode);
    return response;
  }



}
