import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'vote_happy.dart';


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
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
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
                  // Redirigir a la URL cuando se hace clic en el texto
                  launch("https://youtu.be/dQw4w9WgXcQ");
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
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VoteHappy()));
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