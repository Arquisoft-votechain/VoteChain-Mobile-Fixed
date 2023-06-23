import 'package:http/http.dart' as http;
import 'dart:convert';
/*class ListMasterPoliticalPartyService{


  Future<bool>loggingUser(String email, String password) async {

    Uri url = Uri.parse('https://www.votechain.online/electoral-processes/3/political-party-participants');

    final url2 = await http.get(
      Uri.parse('https://www.votechain.online/student/$userId'),);




    var body = json.decode(url2.body);
    final resp = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
        encoding: utf8
    );
    print("funcion login user");
    var userId = json.decode(resp.body);
    print(userId);

    if(userId is int){


      print("el usuario exite");





}*/
