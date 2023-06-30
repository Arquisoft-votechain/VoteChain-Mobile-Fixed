import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/nav-bar.dart';

import 'package:http/http.dart' as http;
import 'package:votechain/src/pages/vote_management/result_win_party/result_electoral_process.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votechain/src/pages/vote_management/vote_political_parties.dart';
import 'vote_verification_response.dart';
class SelectElectoralProcess extends StatefulWidget {
  @override
  _VoteViewState createState() => _VoteViewState();
}

class _VoteViewState extends State<SelectElectoralProcess> {
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
    final schoolId = prefs.getInt('studentSchoolId')!;
    var url = Uri.parse('https://votechain.online/schools/$schoolId/electoral-processes');
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
        title: Text("PROCESOS ELECTORALES"),
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
    var fullName = item['title'];
    var electoralProcessSchoolId = item['id'];
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
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    void func() async{
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setInt('electoralProcessId', electoralProcessSchoolId);
                      var studentId= prefs.getInt('studentId');
                      final url = await http.get(
                        Uri.parse('https://votechain.online/student/$studentId/electoralProcess/$electoralProcessSchoolId/checkVote'),);
                      var body = json.decode(url.body);
                      print(body);

                      var vote=body['exist'];
                      print(vote);
                      if(vote==true){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    voteVerification()));
                      }
                      else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VotePoliticalPartiesView()));
                      }
                    }
                    func();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.brownwhiteColor,
                  ),
                  child: Text('Votar',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
