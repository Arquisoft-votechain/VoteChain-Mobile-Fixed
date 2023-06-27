import 'package:flutter/material.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/pages/user_management/user_views//user_profile.dart';
import 'package:votechain/src/pages/political_party_management/electoral_process.dart';
import 'package:votechain/src/pages/vote_management/vote_electoral_process.dart';
import 'package:votechain/src/pages/user_management/user_login/type_user.dart';
import 'package:votechain/src/pages/vote_management/result_win_party/result_electoral_process.dart';
import 'package:votechain/src/pages/vote_management/vote_political_parties.dart';
import 'package:votechain/src/services/auth_service.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Zara Vea'),
            accountEmail: Text('Zara.Vega@gmail.com'),
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
