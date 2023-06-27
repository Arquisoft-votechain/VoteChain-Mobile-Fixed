import 'package:votechain/src/app.dart';
import 'src/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(VoteChainApp());
}

class VoteChainApp extends StatelessWidget {
  const VoteChainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}


