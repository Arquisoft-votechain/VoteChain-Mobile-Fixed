import 'dart:async';
import 'share_preferences/utils/global-colors.dart';
import 'pages/user_management/user_login/type_user.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TypeUserLogin()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Image(image: AssetImage('assets/img/logo_trans.png')),
        ),
      ),
    );
  }
}
