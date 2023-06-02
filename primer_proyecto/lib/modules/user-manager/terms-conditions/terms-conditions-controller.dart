import '../models/terms-conditions.dart' as globals;
import 'package:get/get.dart';


class TermsConditionsController extends GetxController{
  String mensaje ='';
  void createCount(){

    if(globals.termsConditions == true){
      mensaje="Gracias por aceptar nuestros términos y condiciones";
      update();
    }
    else{
      mensaje="Debe aceptar nuestros términos y condiciones";
      update();
    }
    update();
  }

}