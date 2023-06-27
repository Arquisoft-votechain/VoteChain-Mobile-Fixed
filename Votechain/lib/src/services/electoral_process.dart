import 'dart:convert';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:flutter/material.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ElectoralProcessService{
    static void GetElectoralProcessId () async {

            print('GetElectoralProcessssssssssssssssssssId');
            final prefs = await SharedPreferences.getInstance();
            print("obtniendoel di student");
            final studentElectoralProcess = prefs.getInt('studentId');
            print(studentElectoralProcess);
            final url2 = await http.get(
                Uri.parse('https://www.votechain.online/student/$studentElectoralProcess/electoral-processes'),);
            var bodis = json.decode(url2.body);
            print("primerbody");
            print(bodis);
            print(bodis[0]['id']);
            var idss1=bodis[0]['id'];
            print("idss1");
            print(idss1);
            print(idss1.runtimeType);
            // int idss2= int.parse(idss1);

            // print(idss2);
            // await prefs.setString('electoralProcessId', jsonEncode(body));
            await prefs.setInt('electoralProcessId',idss1);

        }
}
