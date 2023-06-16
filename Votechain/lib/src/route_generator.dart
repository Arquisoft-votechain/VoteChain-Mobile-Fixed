
import 'package:flutter/material.dart';
import 'package:votechain/src/pages/user_management/user_login/student_login.dart';
import 'package:votechain/src/pages/user_management/user_login/type_user.dart';
import 'package:votechain/src/pages/user_management/user_views/student_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case '/login':return MaterialPageRoute(builder: (context)=> const TypeUserLogin() ) ;
      case '/login/student':return MaterialPageRoute(builder: (context)=> const StudentLogin() );
      case '/home':return MaterialPageRoute(builder: (context)=> new StudentView() );
      default: return _errorRoute();

    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context){
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}