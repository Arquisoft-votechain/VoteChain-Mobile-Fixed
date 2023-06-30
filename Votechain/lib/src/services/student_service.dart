import 'package:shared_preferences/shared_preferences.dart';
import 'package:votechain/src/services/auth_service.dart';
import 'dart:convert';
class StudentService{
  var user;
  var emails = ' ';
   void getUser() async{
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    emails = prefs.getString('email')!;
    var userMap = jsonDecode(userString!) ;
    user = userMap;

  }

}