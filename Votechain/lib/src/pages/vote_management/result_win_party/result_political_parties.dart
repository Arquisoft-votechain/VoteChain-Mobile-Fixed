import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:votechain/src/nav-bar.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ResultPoliticalPartiesView extends StatefulWidget {
  @override
  _VoteViewState createState() => _VoteViewState();
}

class _VoteViewState extends State<ResultPoliticalPartiesView> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    final electoralProcessId = prefs.getInt('electoralProcessId')!;
    var url = Uri.parse('https://votechain.online/electoral-processes/$electoralProcessId/political-party-participants/votes');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("LISTA DE PARTIDOS POLITICOS"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (users.contains(null) || users.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(GlobalColors.blueColor),
      ));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    var fullName = item['master_political_party']['name'];
    var vote = item['votes'].toString() ;
    //image: NetworkImage(profileUrl)

    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(60 / 2),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 140,
                        child: Text(
                          fullName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        vote,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
