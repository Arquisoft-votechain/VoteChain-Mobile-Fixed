
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class ClientTermsConditions extends StatefulWidget {
  const ClientTermsConditions({Key? key}) : super(key: key);

  @override
  _ClientTermsConditionsState createState() => _ClientTermsConditionsState();
}

class _ClientTermsConditionsState extends State<ClientTermsConditions> {


  static const termsConditions = """<h1>Términos y Condiciones</h1>
<p>Última actualización: 26 de mayo de 2023</p>
<p>Lea atentamente nuestros términos y condiciones antes de utilizar la aplicación.</p>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
<h1>texto de terminos y condiciones</h1>
""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminos y condiciones'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,

                    child:Html(
                      data: termsConditions,
                      style: {
                        'html' : Style(
                            backgroundColor: Colors.white12
                        ),
                        'table': Style(
                            backgroundColor: Colors.grey.shade200
                        ),
                        'td': Style(
                          backgroundColor: Colors.grey.shade400,
                        ),
                        'th': Style(
                            color: Colors.black
                        ),
                        'tr': Style(
                            backgroundColor: Colors.grey.shade300,
                            border: Border(bottom: BorderSide(color: Colors.greenAccent))
                        ),
                      },
                    ),

                  ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 120,

              child: Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 50.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(

                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.all(Colors.blue)),
                      child: Padding(

                        padding: const EdgeInsets.all(4),
                        child: Row(

                          children: const [
                            Icon(Icons.check),
                            Text('Aceptar')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    ElevatedButton(

                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Debe aceptar los términos y condiciones."),
                        ));
                      },
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red)),
                      child: Padding(

                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: const [
                            Icon(Icons.close),
                            Text('Rechazar')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}


