import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:votechain/src/nav-bar.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';

class MembersView extends StatelessWidget {
  const MembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('MIEMBROS DEL PARTIDO POLITICO'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const SizedBox(height: 10),
              itemProfile('ALCALDE', 'Angel Velasques', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Regidor 1', 'Samir Edwill', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile(
                  'Regidor 2', 'Angela Velasques', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Regidor 3', 'Rocio Medrano', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile(
                  'Regidor 4', 'Pedro Velasques', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Regidor 5', 'Juan Reino', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile(
                  'Regidor 6', 'Angel Hinostroza', CupertinoIcons.person),
            ]),
          ),
        ],
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: GlobalColors.mainColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}
