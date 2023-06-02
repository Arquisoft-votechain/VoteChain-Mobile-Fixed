import 'package:flutter/material.dart';
import './modules/user-manager/user-login/user-type.dart';

void main() {
  runApp(const VoteChainApp());
}

class VoteChainApp extends StatelessWidget {
  const VoteChainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "VoteChain",
      theme: ThemeData(
          primarySwatch:Colors.indigo
      ),
      home: const TypeUserLogin(),
    );
  }
}


