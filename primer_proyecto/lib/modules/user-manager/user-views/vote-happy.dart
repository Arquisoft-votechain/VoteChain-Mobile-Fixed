import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../user-views/vote.dart';


class VoteHappy extends StatelessWidget {
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
              Text(
                "GG",
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VoteView()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
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
