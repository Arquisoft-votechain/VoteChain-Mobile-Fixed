import 'package:flutter/material.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/pages/user_management/user_login/administrator_login.dart';
import 'package:votechain/src/pages/user_management/user_login/student_login.dart';
import 'package:votechain/src/services/auth_service.dart';

class TypeUserLogin extends StatelessWidget {
  const TypeUserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: const AssetImage('assets/img/welcome.png'),
                height: height * 0.3),
            Column(
              children: [
                Text(
                  '¿Cuál es tu rol?',
                  style: TextStyle(
                    color: GlobalColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Text(
                  'Seleccione su rol, por favor.',
                  style: TextStyle(
                    color: GlobalColors.blackColor,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          AuthService.logout();
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdministratorLoginView()),
                          );*/
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            GlobalColors.blueColor,
                          ),
                        ),
                        child: Text('Administrador'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 50,
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentLoginView()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            GlobalColors.blueColor,
                          ),
                        ),
                        child: Text('Estudiante'),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
