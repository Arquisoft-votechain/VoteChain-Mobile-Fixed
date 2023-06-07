import 'package:flutter/material.dart';
import 'candidate.dart';
import '../user-views/user-profile.dart';
import '../user-login/student-login.dart';


class AdministratorView extends StatelessWidget {
  AdministratorView({Key? key}) : super(key: key);
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AdministratorView()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AdministratorView()));
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    width: double.infinity,
                    color: Colors.indigo[700],
                    child: ElevatedButton(
                      child:  Text('Estadisticas', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800]
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AdministratorView()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AdministratorView()));
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
          title: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0,0),
              child: Card(
                  child: Image.asset('assets/img/logo.png')
              )
          ),
        ),
        body: UserProfile(),
      ),
    );
  }
}

