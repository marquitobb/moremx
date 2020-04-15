import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moremx/pages/inicio.dart';
import 'dart:async';
import 'package:toast/toast.dart';



Future<List> obtenerUser(context,String email, String pass) async {
  var url = "http://192.168.1.71:4000/users/login";
  //var url = "http://192.168.1.69/api_login_flutter/obtenerUsuario.php";
  final response = await http.post(url, body: {
    "email": email,
    "pass": pass
  });
  if (response.body == "CORRECTO") {
    Toast.show("LOGIN CORRECTO", context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white);
    //Navigator.of(context).pushNamed('/screen2');
    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return HomePage();
    }));
  } else if (response.body == "ERROR") {
    Toast.show("LOGIN INCORRECTO", context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}