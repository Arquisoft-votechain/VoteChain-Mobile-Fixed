import 'package:flutter/material.dart';
import 'package:votechain/src/pages/user_management/user_views/user_profile.dart';
import 'package:votechain/src/share_preferences/utils/global-colors.dart';
import 'package:votechain/src/pages/user_management/user_register/student_register.dart';
import 'package:votechain/src/pages/user_management/user_views/student_view.dart';
import 'package:votechain/src/services/auth_service.dart';

import 'package:votechain/src/share_preferences/user_preferences.dart';
import 'package:votechain/src/route_generator.dart';

class StudentLoginView extends StatelessWidget {
  const StudentLoginView({Key? key}) : super(key: key);

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
          'Bienvenido (a)',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 60,
          ),
        ),
        Text(
          'Ingrese al sistema :)',
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
  bool _obscureText = true;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  void loginValidation() async{

    bool validate = await AuthService().loggingUser(_emailController.text,_passwordController.text);
    if(validate==true){
      await AuthService().GetStudent();
     // ElectoralProcessService.GetElectoralProcessId();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentFirstView()),
      );
    }

  }




  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "E-Mail",
                hintText: "E-Mail",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText
                        ? Icons.remove_red_eye_sharp
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                      loginValidation();
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(GlobalColors.blueColor),
                ),
                child: Text("Login".toUpperCase()),
              ),
            ),
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
              MaterialPageRoute(builder: (context) => StudentRegisterView()),
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
                TextSpan(text: "Signup", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
