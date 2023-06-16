import 'package:http/http.dart' as http;
import 'dart:convert';
class ListVoteService{

  Future<http.Response> postVote(int studentId, int politicalPartyId) async{
    int studentId = 9;
    //student/$studentId
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
}
