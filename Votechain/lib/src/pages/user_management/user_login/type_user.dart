import 'dart:convert';
import 'package:votechain/src/util/color.dart';
import 'package:flutter/material.dart';
import 'package:votechain/src/util/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:votechain/src/services/electoral_process.dart';
import 'package:votechain/src/services/auth_service.dart';

class TypeUserLogin extends StatefulWidget {
  const TypeUserLogin({Key? key}) : super(key: key);

  @override
  _TypeUserLoginState createState() => _TypeUserLoginState();
}

class _TypeUserLoginState extends State<TypeUserLogin> {

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final double width= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              height: 230,
              padding: const EdgeInsets.fromLTRB(10, 80, 10,30),
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Image.asset('assets/img/logo.png'))
          ),
          Divider(color: Colors.black),

          Container(
            padding: const EdgeInsets.fromLTRB(0, 40, 0,0),
            height: 265, width: 400,
            child: Stack(
              children: [
                Positioned(
                  top:24, left: 17,
                  child: Material(
                    child: Container(
                      height: 180, width: 400,
                      decoration: BoxDecoration(
                        color:Colors.lightBlue,
                      ),
                    ),
                  ),),
                Positioned(
                    left:4,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 190, width:250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image : DecorationImage(
                              fit: BoxFit.fill,
                              image:NetworkImage('https://carrerasuniversitarias.pe/img/article/estudiantes-prefieren-educacion-a-distancia')
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top:50,
                  left:270,
                  child: Container(
                      height: 170, width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Estudiante", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                          Text("\nIniciar sesion\ncomo estudiante", style: TextStyle(fontSize: 16, color: Colors.black54),),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                            height: 30,
                            width: 100,
                            child: ElevatedButton(
                              child:  Text('Login', textAlign: TextAlign.center,style: TextStyle(fontSize: 17)),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[800]
                              ),
                              onPressed: () {
                                AuthService.logout();
                                Navigator.of(context).pushReplacementNamed('/login/student');
                              },
                            ),),
                        ],
                      )
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0,0),
            height: 265, width: 400,
            child: Stack(
              children: [
                Positioned(
                  top:24, left: 17,
                  child: Material(
                    child: Container(
                      height: 180, width: 400,
                      decoration: BoxDecoration(
                        color:Colors.lightBlue,
                      ),
                    ),
                  ),),
                Positioned(
                    left:4,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 190, width:250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image : DecorationImage(
                              fit: BoxFit.fill,
                              image:NetworkImage('https://orientacion.universia.net.co/imgs2011/imagenes/man-with-p-2022_10_03_173439@2x.jpg')
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top:50, left:270,
                    child: Container(
                        height: 170, width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Administrator", style: TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.bold),),
                            Text("\nIniciar sesion\ncomo administrador", style: TextStyle(fontSize: 16, color: Colors.black54)),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),

                              height: 30, width: 100,
                              child: ElevatedButton(
                                child:  Text('Login', textAlign: TextAlign.center,style: TextStyle(fontSize: 17)),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[800]
                                ),
                                onPressed: () {
                                 /* Navigator.of(context).pushReplacementNamed('/home');*/
                                },
                              ),),
                          ],
                        )
                    )
                )
                ////
              ],
            ),
          ),
        ],
      ),
    );
  }
}
