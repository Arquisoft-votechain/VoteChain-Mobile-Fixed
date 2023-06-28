import 'dart:convert';
import 'package:votechain/src/models/authenticate.dart';
import 'package:votechain/src/share_preferences/user_preferences.dart';
import 'package:votechain/src/services/user_student_service.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
class AuthService{


  final _prefs = UserPreferences();
  final _userStudent = UserStudentService();
  //final String _dataUrl = "https://www.votechain.online/user";
  //https://www.votechain.online/api/
 // var userId =json.decode("");
  Future<bool>loggingUser(String email, String password) async {

    Uri url = Uri.parse('https://www.votechain.online/user/verifyUser');
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
    print("id del usuario");
    print(userId);

      if(userId is int){
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setInt('userId', userId);
        print("el usuario exite");
        return true;
      }
      else{     print("el usuario no exite"); return false;}
  }


  Future<void> GetStudent() async {
    print("enotro aget student");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    print("sigue corriendo1");
    final url2 = await http.get(
      Uri.parse('https://www.votechain.online/student/user/$userId'),);
    var body = json.decode(url2.body);
    print("este es el user Id-----------------------");
    print(userId);

    print("sigue corriendo");
    await prefs.setString('user', jsonEncode(body));
    final userString = prefs.getString('user');
    var user;
    var userMap = jsonDecode(userString!) ;
    user = userMap;
    print(user);
    var mientras=user['resource']['name'];
    print (mientras);
    print(user['name']);
    var finalStudentId =user['resource']['id'];
    await prefs.setInt('studentId', finalStudentId);
    print("funcion GetStudent");
  }

  static void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('studentId');
    await prefs.remove('email');
    await prefs.remove('user');
    await prefs.remove('userId');
    await prefs.remove('electoralProcessId');
    await prefs.remove('masterPoliticalPartyVoteId');
    await prefs.remove('codeVerification');
  }
}