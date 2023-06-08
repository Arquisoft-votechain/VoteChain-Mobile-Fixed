import 'package:flutter/material.dart';
import '../user-views/vote.dart';
import '../user-views/vote-verification-blockchain.dart';

class VoteIfNotView extends StatelessWidget {
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
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VoteVerificationBlockchain()));
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
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VoteView()));
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
