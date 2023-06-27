/*import 'package:flutter/material.dart';
import 'package:votechain/src/pages/user_management/user_views/student_view.dart';
import 'pages/user_management/user_login/student_login.dart';
import 'pages/user_management/user_login/type_user.dart';
import 'pages/user_management/user_views/user_profile.dart';
//import 'pages/vote_management/vote.dart';
//import 'pages/vote_management/vote_if_not.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case '/login':return MaterialPageRoute(builder: (context)=> const TypeUserLogin() ) ;
      case '/login/student':return MaterialPageRoute(builder: (context)=> const StudentLoginView() );
      case '/home':return MaterialPageRoute(builder: (context)=> new StudentFirstView() );
      case '/profile':return MaterialPageRoute(builder: (context)=> new UserProfileView());
      //case '/vote':return MaterialPageRoute(builder: (context)=> new VoteView());
      //case '/ifnot':return MaterialPageRoute(builder: (context)=> new VoteIfNotView());
      default: return MaterialPageRoute(builder: (context)=> new StudentFirstView() );

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
}*/