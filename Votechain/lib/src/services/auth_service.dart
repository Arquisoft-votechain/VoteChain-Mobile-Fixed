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
    var userId = json.decode(resp.body);


      if(userId is int){
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setInt('userId', userId);
        return true;
      }
      else{
        return false;}
  }


  Future<void> GetStudent() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    final url2 = await http.get(
      Uri.parse('https://www.votechain.online/student/user/$userId'),);
    var body = json.decode(url2.body);

    await prefs.setString('user', jsonEncode(body));
    final userString = prefs.getString('user');
    var user;
    var userMap = jsonDecode(userString!) ;
    user = userMap;
    var finalStudentId =user['resource']['id'];
    await prefs.setInt('studentId', finalStudentId);
    var classroomId =user['resource']['classroomId'];
    await prefs.setInt('classroomId', classroomId);
    final response = await http.get(
      Uri.parse("https://votechain.online/classrooms"),);
    var body2 = json.decode(response.body) as List;
    var class1= prefs.getInt('classroomId');
    for(var a in body2){
      var class2= a["id"];
      if(class1==class2){
      await prefs.setInt('studentSchoolId', a["school_id"]);
      break;
      }
    }
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
    await prefs.remove('classroomId');
    await prefs.remove('school_id');
  }
}