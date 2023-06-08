import 'package:flutter/material.dart';
import '../user-views/vote.dart';

class VoteIfNotView extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Verificar Voto'),
        ),
        body: Center(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Primera fila - imagen redondeada
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Imagen',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Segunda fila - texto "Advertencia"
                  Text(
                    'Advertencia',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Tercera fila - texto "Seguro que quiere realizar su voto?"
                  Text(
                    '¿Seguro que quiere realizar su voto?',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Cuarta fila - botones "SI" y "NO"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
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
                          primary: Colors.red,
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
