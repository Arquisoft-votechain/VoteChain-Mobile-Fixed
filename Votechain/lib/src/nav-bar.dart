import 'package:flutter/material.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/pages/user_management/user_views//user_profile.dart';
import 'package:votechain/src/pages/political_party_management/electoral_process.dart';
import 'package:votechain/src/pages/vote_management/vote_electoral_process.dart';
import 'package:votechain/src/pages/user_management/user_login/type_user.dart';
import 'package:votechain/src/pages/vote_management/result_win_party/result_electoral_process.dart';
import 'package:votechain/src/pages/vote_management/vote_political_parties.dart';
import 'package:votechain/src/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
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
    print(user['resource']['identifier']??"",);
  }

  @override
  Widget build(BuildContext context) {
    get_user().then((value) {
      setState(() {
        user = user;
        //  emails=emails;

      });
    });
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text( "${user['resource']['name'] ?? ""} ${user['resource']['lastName']?? ""}",),
            accountEmail: Text(emails),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/img/profile.png',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: GlobalColors.mainColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileView()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.ballot),
            title: Text('Partidos Politicos Participantes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ElectoralProcessView()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.how_to_vote),
            title: Text('Votar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VotePoliticalPartiesView()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.leaderboard),
            title: Text('Resultado de Conteo de Votos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultElectoralProcessView()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              AuthService.logout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TypeUserLogin()),
              );
            },
          ),
        ],
      ),
    );
  }
}
