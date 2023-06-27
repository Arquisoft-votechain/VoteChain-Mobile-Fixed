import 'package:flutter/material.dart';
import 'package:votechain/src/pages/user_management/user_views/user_profile.dart';


class StudentFirstView extends StatelessWidget {
  StudentFirstView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserProfileView(),
    );
  }
}
