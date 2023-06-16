import 'dart:convert';
import 'package:votechain/src/models/authenticate.dart';
import 'package:votechain/src/share_preferences/user_preferences.dart';
import 'package:votechain/src/services/user_student_service.dart';
import 'package:http/http.dart' as http;

class AuthService{
  final _prefs = UserPreferences();
  final _userStudent = UserStudentService();
  final String _dataUrl = "https://www.votechain.online/user";

  /*Future<Map<String,dynamic>> loggingUser(Authenticate user) async
  {
    Uri url = Uri.parse('https://www.votechain.online/user');
    final resp = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: authenticateToJson(user),
    );


    Map<String, dynamic> decodeResp = json.decode(resp.body);

    //print(decodeResp);
    if (decodeResp.containsKey('token')) {
      //Guardar el token
      _prefs.Token = decodeResp['token'];
      _prefs.Id = decodeResp['id'];
      _prefs.IsStudent = decodeResp['studentId'];
    }
  }*/
}