import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../user-login/administrator-login.dart';
import '../terms-conditions/terms-conditions.dart';
import '../terms-conditions/terms-conditions-controller.dart';



class AdministratorRegister extends StatefulWidget {
  AdministratorRegister({Key? key}) : super(key: key);
  @override
  _AdministratorRegisterState createState() => _AdministratorRegisterState();
}
class _AdministratorRegisterState extends State<AdministratorRegister> {

  final name = TextEditingController();
  final lastName = TextEditingController();
  final dni = TextEditingController();
  final school = TextEditingController();
  final phone = TextEditingController();
  final urlToImageBackground = TextEditingController();
  final urlToImageProfile = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();

  bool isCheckedConditionsandTerms = false;
  String? claveError;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermsConditionsController>(
      init: TermsConditionsController(),
      builder: (_){
        Color getColor(Set<MaterialState> states) {
          const Set<MaterialState> interactiveStates = <MaterialState>{
            MaterialState.pressed,
            MaterialState.hovered,
            MaterialState.focused,
          };
          if (states.any(interactiveStates.contains)) {
            return Colors.blue;
          }
          return Colors.red;
        }
        return Scaffold(body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 80, 10,50),
                    child: Card(
                        child: Image.asset('assets/img/logo.png')

                    )
                ),
                const Text(
                  "Registrate",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                        hintText: "Nombre", border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: lastName,
                    decoration: const InputDecoration(
                        hintText: "Apellido", border: InputBorder.none),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: dni,
                    decoration: const InputDecoration(
                        hintText: "Dni", border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: school,
                    decoration: const InputDecoration(
                        hintText: "school", border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: "Telefono", border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: urlToImageBackground,
                    decoration: const InputDecoration(
                        hintText: "Imagen de fondo de perfil", border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: urlToImageProfile,
                    decoration: const InputDecoration(
                        hintText: "Imagen de perfil", border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    decoration: const InputDecoration(
                        hintText: "Email", border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        errorText: claveError,
                        hintText: "Contraseña",
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: password2,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Confirmar Contraseña",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 30),
                Text(_.mensaje,
                  style: TextStyle(
                    color: Colors.orange,
                  ),),
                DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).textTheme.titleMedium!.color),
                  child: Wrap(
                    //ItemsScreen
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Checkbox(value: isCheckedConditionsandTerms, onChanged: (v) {
                        final result = Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ClientTermsConditions()));
                        result.then((value) => {
                          setState(() { isCheckedConditionsandTerms = value; })
                        });
                      }),
                      Text("I Agree to the "),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ClientTermsConditions()));
                        },
                        child: Text(
                          "Terms of services ",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("&"),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ClientTermsConditions()));
                        },
                        child: Text(" Privacy Policy",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),



                ),
                ElevatedButton(

                  child:  Text('Crear cuenta', textAlign: TextAlign.center,style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800]
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AdministratorLogin()));
                  },

                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AdministratorLogin()));
                    },
                    child: const Text("Ya tengo una cuenta"))
              ],
            ),
          ),
        ),);
      },


    );
  }

  Future<void> register() async {
    if (password.text != password2.text) {
      setState(() {
        claveError = "Contraseñas no coinciden";
      });
      return;
    }
    setState(() {
      claveError = null;
    });
  }
}