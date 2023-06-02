import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         ListView(
      children: <Widget>[
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.indigo.shade300],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    minRadius: 60.0,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                      NetworkImage('https://definicion.de/wp-content/uploads/2019/07/perfil-de-usuario.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Nicolas Leo',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'nicolas@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Teléfono',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '+51123456789',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Grado',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '5to Secundaria',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Seccion',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'C',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );

  }
}
