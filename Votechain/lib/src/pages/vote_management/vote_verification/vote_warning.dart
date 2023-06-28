import 'package:flutter/material.dart';
import 'package:votechain/src/services/vote_service.dart';
import '../vote_electoral_process.dart';
import 'vote_verification_blockchain.dart';
import 'dart:math';
import 'package:votechain/src/pages/vote_management/vote_political_parties.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoteWarningView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Primera fila - imagen redondeada
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60 / 2),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/warning.png'),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Segunda fila - texto "Advertencia"
                  Text(
                    "ADVERTENCIA",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFfec047),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  // Tercera fila - texto "Seguro que quiere realizar su voto?"
                  Text(
                    '¿Seguro que quiere realizar su voto?',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 10.0),

                  // Cuarta fila - botones "SI" y "NO"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          int n = Random().nextInt(500) + 100000;
                          print("atento este es el codigooooooooooo $n");
                          void func() async{

                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setInt('codeVerification', n);
                          }
                          func();
                          ListVoteService().codeVerification(n);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      VoteVerificationBlockchain()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                        ),
                        child: Text('SI'),
                      ),
                      SizedBox(width: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      VotePoliticalPartiesView()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                        ),
                        child: Text('NO'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
