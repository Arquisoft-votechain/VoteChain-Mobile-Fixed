import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:votechain/src/nav-bar.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'vote_verification/vote_warning.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votechain/src/services/vote_service.dart';
class VotePoliticalPartiesView extends StatefulWidget {
  @override
  _VoteViewState createState() => _VoteViewState();
}

class _VoteViewState extends State<VotePoliticalPartiesView> {
  List users = [];
  bool isLoading = false;
  late ListVoteService listPublicationsService= ListVoteService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    print("iniciando fectch User");
    setState(() {
      isLoading = true;
    });
    print("iniciando importnate");
    final prefs = await SharedPreferences.getInstance();
    final electoralProcessId = prefs.getInt('electoralProcessId')!;
    var url = Uri.parse('https://www.votechain.online/electoral-processes/$electoralProcessId/political-party-participants');
    var response = await http.get(url);
    print("estos son los partidos"+response.body);
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
        title: Text("VOTACION: ESCOJA UN PARTIDO"),
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
    var description = item['master_political_party']['description'];
    var masterPoliticalPartyId = item['master_political_party']['id'];
    //image: NetworkImage(profileUrl)

    void voteListMasterPoliticalParty() async{
      final prefs = await SharedPreferences.getInstance();
      final studentVoteId =prefs.getInt('studentId')!;
      print("este es studentVoteID $studentVoteId, este es masterid $masterPoliticalPartyId");
      await prefs.setInt('masterPoliticalPartyVoteId', masterPoliticalPartyId);
      ///listPublicationsService.postVote(studentVoteId,masterPoliticalPartyId);
    }
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: <Widget>[
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
                      Text(
                        description.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
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
                    voteListMasterPoliticalParty();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VoteWarningView()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.blueColor,
                  ),
                  child: Text('VOTE', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
