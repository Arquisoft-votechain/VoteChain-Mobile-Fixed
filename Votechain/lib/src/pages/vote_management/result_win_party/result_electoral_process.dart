import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/nav-bar.dart';
import 'package:votechain/src/pages/political_party_management/political_parties.dart';
import 'package:http/http.dart' as http;
import 'result_political_parties.dart';

class ResultElectoralProcessView extends StatefulWidget {
  @override
  _VoteViewState createState() => _VoteViewState();
}

class _VoteViewState extends State<ResultElectoralProcessView> {
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
    var url = Uri.parse('https://randomuser.me/api/?results=10');
    var response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['results'];
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
        title: Text("RESULTADOS"),
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
    var fullName = item['name']['title'] +
        " " +
        item['name']['first'] +
        " " +
        item['name']['last'];
    var email = item['email'];
    var profileUrl = item['picture']['large'];
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
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(profileUrl),
                      ),
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ResultPoliticalPartiesView()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.brownwhiteColor,
                  ),
                  child: Text('VIEW RESULT',
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
