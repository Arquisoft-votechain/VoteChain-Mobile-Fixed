import 'package:flutter/material.dart';
import '../user-login/student-login.dart';
import '../user-views/student-view.dart';
import '../user-views/candidate-members.dart';

class CandidateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(        
        
        drawer: Drawer(
          child:  Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              color: Colors.blue[100],
          child: Column(

            children: [

              Container(

                width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top:50, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  border: Border.all(color: Colors.black54, width: 2),
                  image: DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP_nUjoOIjQJloeQ1FWs9JWL4Xbi8gjuiv0Q&usqp=CAU'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10,10, 10, 30),
                   child: Text("Nicolas Leo", style: TextStyle(fontWeight: FontWeight.bold,  fontSize:20)),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                color: Colors.indigo[700],
                child: ElevatedButton(
                  child:  Text('Perfil', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800]
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StudentView()));
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                color: Colors.indigo[700],
                child: ElevatedButton(
                  child:  Text('Candidatos', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800]
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CandidateView()));
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                color: Colors.indigo[700],
                child: ElevatedButton(
                  child:  Text('Proceso Electoral', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800]
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StudentView()));
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                color: Colors.indigo[700],
                child: ElevatedButton(
                  child:  Text('Voto', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800]
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StudentView()));
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                color: Colors.indigo[700],
                child: ElevatedButton(
                  child:  Text('Cerrar Sesion', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800]
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StudentLogin()));
                  },
                ),
              ),
            ],
          )
          ),
        ),


        
        appBar: AppBar(
          title: Text('PARTIDOS POLITICOS'),
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
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CandidateMembersView()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF3F468F),
                              ),
                              child: Text('INFO', style: TextStyle(color: Colors.white)),
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
                              child: Text('INFO', style: TextStyle(color: Colors.white)),
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
                              child: Text('INFO', style: TextStyle(color: Colors.white)),
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
                              child: Text('INFO', style: TextStyle(color: Colors.white)),
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