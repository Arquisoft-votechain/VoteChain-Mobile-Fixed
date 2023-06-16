import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:votechain/src/route_generator.dart';
import 'package:votechain/src/services/auth_service.dart';
import 'package:votechain/src/share_preferences/user_preferences.dart';

import 'package:votechain/src/pages/user_management/user_views/student_view.dart';
class StudentLogin extends StatelessWidget {
  const StudentLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const UserLoginWidget(),
    );
  }
}


class UserLoginWidget extends StatefulWidget {
  const UserLoginWidget({Key? key}) : super(key: key);

  @override
  State<UserLoginWidget> createState() => _UserLoginWidgetState();
}

class _UserLoginWidgetState extends State<UserLoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _authService = AuthService();
  final _prefs = UserPreferences();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/login-background.jpg'),
            fit: BoxFit.cover
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            logoBox(),
            emailBox(),
            passwordBox(),
            TextButton(
              onPressed: () {
              },
              child: const Text('Forgot Password',),

            ),
            loginButtonBox(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('home');
              },
              child: const Text('Create Account',),

            ),

          ],
        ),

      ),
    );
  }


  Widget logoBox() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 80, 10,50),
        child: Card(
            child: Image.asset('assets/img/logo.png')

        )
    );
  }

  Widget emailBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: emailController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
      ),
    );
  }

  Widget passwordBox() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextField(
        obscureText: true,
        controller: passwordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget loginButtonBox() {
    return Container(
          height: 65,
          width: 250,
          child: ElevatedButton(
            child:  Text('Login', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800]
            ),
            onPressed: () {
              //va restistriccion para logeo
              //Navigator.of(context).pushReplacementNamed('/home');
            },

          ),
        );
  }


}
