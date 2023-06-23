import 'package:flutter/material.dart';
import 'package:votechain/src/services/auth_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class StudentProfile extends StatefulWidget {
  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {

  var user;
  var emails = ' ';
  Future get_user() async{
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    emails = prefs.getString('email')!;
    var userMap = jsonDecode(userString!) ;
    //var emailMap=jsonDecode(emailString!);
    user = userMap;
   // emails=emailMap;
    print("holaaaaaaaaaaaaaaaaaaaaaaa");
    print(user['resource']['identifier']??"",);

  }

  @override
  Widget build(BuildContext context) {
print('estamos cargando al usuario');
    get_user().then((value) {
      setState(() {
        user = user;
     //  emails=emails;

      });
    });
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Colors.indigo.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                        NetworkImage('https://definicion.de/wp-content/uploads/2019/07/perfil-de-usuario.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  "${user['resource']['name'] ?? ""} ${user['resource']['lastName']?? ""}",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    emails,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Codigo',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    user['resource']['identifier']??"",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Grado',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '5to Secundaria',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Seccion',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'C',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
}
