import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/nav-bar.dart';
import 'package:http/http.dart' as http;
import 'result_political_parties.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _PieData {
  final String xData;
  final num yData;
  final String? text;
  _PieData(this.xData, this.yData, {this.text});
}

class ResultElectoralProcessView extends StatefulWidget {
  @override
  _VoteViewState createState() => _VoteViewState();
}

class _VoteViewState extends State<ResultElectoralProcessView> {
  List users = [];
  bool isLoading = false;
  List<_PieData> listPieData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.fetchUser();
    this.fetchResults();
  }

  fetchResults() async {
    final prefs = await SharedPreferences.getInstance();
    final electoralProcessId = prefs.getInt('electoralProcessId')!;

    var url = Uri.parse(
        'https://www.votechain.online/electoral-processes/$electoralProcessId/political-party-participants/votes');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var items = json.decode(response.body) as List<dynamic>;
      var itemsMap = items.asMap();

      itemsMap.forEach((key, value) {
        listPieData.add(_PieData('${value['votes']}', value['votes'], text: '${value['master_political_party']['name']}'));
      });

      setState(() { });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("RESULTADOS"),
      ),
      body: SafeArea(child: realBody()),
    );
  }

  Widget realBody() {
    return Center(
      child: Column(
        children: [
          Center(
              child:SfCircularChart(
                  title: ChartTitle(text: 'Resultados del proceso electoral'),
                  legend: Legend(isVisible: true),
                  series: <PieSeries<_PieData, String>>[
                    PieSeries<_PieData, String>(
                        explode: true,
                        explodeIndex: 0,
                        dataSource: listPieData,
                        xValueMapper: (_PieData data, _) => data.xData,
                        yValueMapper: (_PieData data, _) => data.yData,
                        dataLabelMapper: (_PieData data, _) => data.text,
                        dataLabelSettings: DataLabelSettings(isVisible: true)),
                  ]
              )
          )
        ],
      ),
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