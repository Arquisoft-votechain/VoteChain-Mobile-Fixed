import 'package:flutter/material.dart';
import '../user-views/vote-if-not.dart';

class VoteView extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(        

        appBar: AppBar(
          title: Text('VOTACION'),
        ),


        body: SingleChildScrollView(
          child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFFED3131), width: 1),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/img/image1.jpg',
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),

                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NOMBRE DE PARTIDO POLITICO',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Alcalde: Angel Velasquez Nuñez',
                                  textAlign: TextAlign.left,
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VoteIfNotView()));
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
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFFED3131), width: 1),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/img/image1.jpg',
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NOMBRE DE PARTIDO POLITICO',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Alcalde: Angel Velasquez Nuñez',
                                  textAlign: TextAlign.left,
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                // Acción al presionar el botón
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
                ),
              ),
              SizedBox(height: 100) //spacer final
            ],
          ),
        ),
        ),
      ),
    );
  }
}