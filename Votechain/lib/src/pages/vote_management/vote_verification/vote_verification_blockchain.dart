import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:votechain/src/pages/vote_management/vote_verification/vote_verification-not.dart';
import 'vote_verification-yes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votechain/src/services/vote_service.dart';
class VoteVerificationBlockchain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: VerificationCard(),
      ),
    );
  }
}

class VerificationCard extends StatelessWidget {
  TextEditingController codeValidation = TextEditingController();
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
              Text(
                "Código de verificación",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                "Este código de verificación nos ayudará a confirmar su identidad. Por favor ingrese el código de 6 dígitos",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: codeValidation,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
                decoration: InputDecoration(
                  labelText: "Ingrese el código",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              CountdownWidget(),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {

                },
                child: Text(
                  "REENVIAR CODIGO",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {

                  void func() async{
                    final prefs = await SharedPreferences.getInstance();
                    int codeVerification = prefs.getInt('codeVerification')!;
                    var probar = int.parse(codeValidation.text);
                    if(probar==codeVerification){
                      final student = prefs.getInt('studentId')!;
                      final politicalParty = prefs.getInt('masterPoliticalPartyVoteId')!;
                      ListVoteService().postVote(student, politicalParty);
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VoteVerificationYesView()));
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VoteVerificationNotView()));
                    }
                  }

                  func();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text("Enviar voto"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountdownWidget extends StatefulWidget {
  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        secondsRemaining--;
      });

      if (secondsRemaining > 0) {
        startCountdown();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = secondsRemaining ~/ 60;
    int seconds = secondsRemaining % 60;

    return Text(
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      style: TextStyle(fontSize: 24.0),
      textAlign: TextAlign.center,
    );
  }
}
