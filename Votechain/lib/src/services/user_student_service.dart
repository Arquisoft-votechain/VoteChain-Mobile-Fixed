import 'dart:convert';
import 'package:votechain/src/share_preferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class UserStudentService{
  final String _dataUrl = "https://www.votechain.online/user";
  final UserPreferences _prefs = UserPreferences();

  Future<Map<String,dynamic>> getUserStudent(int id) async
  {
    Uri url = Uri.parse('https://www.votechain.online/user/$id');


    final resp = await http.get(
      url,
      headers: {"Content-Type": "application/json",
        'Authorization': 'Bearer ${_prefs.token}'},
    );


    Map<String,dynamic> decodeResp = json.decode(resp.body);

    if(decodeResp.containsKey('name'))
    {

      return {'ok':true,'user':decodeResp};
    }
    else{
      //no guardo el usuario o ya existe
      return {'ok':false,'message':decodeResp};
    }
  }

  Future<Map<String,dynamic>> validateLogin(int id) async
  {
    Uri url = Uri.parse('https://www.votechain.online/user/$id');


    final resp = await http.get(
      url,
      headers: {"Content-Type": "application/json",
        'Authorization': 'Bearer ${_prefs.token}'},
    );


    Map<String,dynamic> decodeResp = json.decode(resp.body);

    if(decodeResp.containsKey('name'))
    {

      return {'ok':true,'user':decodeResp};
    }
    else{
      //no guardo el usuario o ya existe
      return {'ok':false,'message':decodeResp};
    }
  }
}