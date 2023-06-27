import 'package:flutter/material.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/pages/user_management/user_login/student_login.dart';

class StudentRegisterView extends StatelessWidget {
  const StudentRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: const [
                LoginHeaderWidget(),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage('assets/img/icon.png'),
            height: size.height * 0.2),
        Text(
          'Registrate',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 60,
          ),
        ),
        Text(
          'Ingrese datos :)',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('FullName'),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('Email'), prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('NumberPhone'), prefixIcon: Icon(Icons.numbers)),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('Password'), prefixIcon: Icon(Icons.fingerprint)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(GlobalColors.blueColor),
                ),
                child: Text('Signup'.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentLoginView()),
            );
          },
          style: TextButton.styleFrom(
            alignment: Alignment.center,
          ),
          child: Text.rich(
            TextSpan(
              text: "Don't have an Account? ",
              style: Theme.of(context).textTheme.bodyLarge?.merge(
                    TextStyle(
                      fontSize: 18,
                    ),
                  ),
              children: const [
                TextSpan(text: "LogIn", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
