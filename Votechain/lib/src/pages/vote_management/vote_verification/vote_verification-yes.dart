import 'package:flutter/material.dart';
import '../vote_electoral_process.dart';
import 'package:votechain/src/pages/vote_management/vote_political_parties.dart';
class VoteVerificationYesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HappyCard(),
      ),
    );
  }
}

class HappyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 300.0,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60 / 2),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/good.png'),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Voto realizado",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                "Estimado(a) Elector(a): Queremos informarle que su  participación ha sido registrada satisfactoriamente.",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              VotePoliticalPartiesView()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text("Volver al Inicio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
