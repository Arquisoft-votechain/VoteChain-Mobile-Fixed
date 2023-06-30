import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:votechain/src/nav-bar.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/services/student_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserProfileView extends StatefulWidget {

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}
class _UserProfileViewState extends State<UserProfileView> {

  var user;
  var emails = ' ';

  Future get_user() async{
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    emails= prefs.getString('email')!;
    var userMap = jsonDecode(userString!) ;
    user = userMap;

  }
  @override
  void initState(){
    get_user();
  }
  Widget build(BuildContext context) {
    get_user().then((value) {
      setState(() {
        user = user;

      });
    });

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Mi Perfil'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: GlobalColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20 * 2),
                bottomLeft: Radius.circular(20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  minRadius: 50,
                  backgroundColor: GlobalColors.blueColor,
                  backgroundImage: AssetImage('assets/img/profile.png'),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const SizedBox(height: 20),
              itemProfile('Nombre', "${user['resource']['name'] ?? ""} ${user['resource']['lastName']?? ""}", CupertinoIcons.person),
              const SizedBox(height: 20),
              itemProfile('Código',  user['resource']['identifier']??"", CupertinoIcons.arrow_left_to_line_alt),
              const SizedBox(height: 20),
              itemProfile('Email', emails,
                  CupertinoIcons.mail),
              const SizedBox(
                height: 20,
              ),
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
                color: GlobalColors.orangeColor.withOpacity(.2),
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
