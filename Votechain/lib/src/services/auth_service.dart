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
    userId=userId-1;

    print(userId);

      if(userId is int){
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('studentId', userId);
        await prefs.setString('email', email);

        print("el usuario exite");
      //  _prefs.Id=userId;

        /*final url2 = await http.get(
            Uri.parse('https://www.votechain.online/student'),);
        var body = json.decode(url2.body) as List;
        for(var a in body){
          var id = a["id"];
          if(id==userId){print("te encontre");

          break;
          }
          else{
            print("No te encontre");
          }
        }

        Map<String,dynamic> decodeResp = json.decode(resp.body);
        /*final user = await _userStudent.getUserStudent(_prefs.id);*/
*/
        return true;
      }
      else{     print("el usuario no exite"); return false;}
  }


  Future<void> GetStudent() async {
    print("enotro aget student");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('studentId');
    print("sigue corriendo1");
    final url2 = await http.get(
      Uri.parse('https://www.votechain.online/student/$userId'),);
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

    print("funcion GetStudent");
  }

  static void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('studentId');
    await prefs.remove('email');
    await prefs.remove('user');
    await prefs.remove('electoralProcessId');
  }
}