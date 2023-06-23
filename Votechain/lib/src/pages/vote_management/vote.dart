import 'dart:convert';
import 'package:votechain/src/util/color.dart';
import 'package:flutter/material.dart';
import 'package:votechain/src/util/color.dart';
import '../vote_management/vote_if_not.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import '../../util/color.dart';
import 'vote_if_not.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:votechain/src/services/electoral_process.dart';
import 'package:votechain/src/services/vote_service.dart';
class VoteView extends StatefulWidget {
  @override
  _VoteViewState createState() => _VoteViewState();

}

class _VoteViewState extends State<VoteView> {
  late ListVoteService listPublicationesService= ListVoteService();

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
    print('ElectoralProcessService.GetElectoralProcessId');
    print('ElectoralProcessService.GetElectoralProcessId finnnnnnnnnnn');
   final electoralProcessId = prefs.getInt('electoralProcessId')!;

    print("este es el id de proceso $electoralProcessId");
    var url = Uri.parse('https://www.votechain.online/electoral-processes/$electoralProcessId/political-party-participants');
    var response = await http.get(url);
    print(response.body);
    if(response.statusCode == 200){
      var items = json.decode(response.body);
      setState(() {
        users = items;
        isLoading = false;
      });
    }else{
      users = [];
      isLoading = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LISTA DE PARTIDOS POLITICOS"),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    if(users.contains(null) || users.length < 0 || isLoading){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          return getCard(users[index]);
        });
  }
  Widget getCard(item) {
    print(item);
    var fullName = item['master_political_party']['name'];
    print(fullName);
    var email = item['master_political_party']['description'];
   var masterPoliticalPartyId = item['master_political_party']['id'];

    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: <Widget>[
                  /*Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(60 / 2),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(profileUrl),
                      ),
                    ),
                  ),*/
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
                        email.toString(),
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
                //boton
                child: ElevatedButton(
                  onPressed: () {

                    print("vamos a relaizar el voto");
                    print(masterPoliticalPartyId);

                    void func() async{
                      final prefs = await SharedPreferences.getInstance();
                      final studentVoteId =prefs.getInt('studentId')!;
                      print("este es studentVoteID $studentVoteId, este es masterid $masterPoliticalPartyId");
                      listPublicationesService.postVote(studentVoteId,masterPoliticalPartyId);
                    }
                    func();
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VoteIfNotView()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3F468F),
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



 /* Future<void>loggingUser(String email, String password) async {
    final url2 = await http.get(
      Uri.parse('https://www.votechain.online/electoral-processes/3/political-party-participants'),);

    var body = json.decode(url2.body);

    print("funcion login user");
    var userId = json.decode(resp.body);
    print(userId);

    if(userId is int) {
      print("el usuario exite");
    }
  }*/

}


