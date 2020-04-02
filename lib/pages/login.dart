import 'package:flutter/material.dart';
import 'package:moremx/pages/inicio.dart';
import 'package:moremx/pages/registrar.dart';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controlUsuario = new TextEditingController();
  TextEditingController controlContrasena = new TextEditingController();

  Future<List> obtenerUsuario() async {
    var url = "https://primeromc.000webhostapp.com/obtenerUsuario.php";
    //var url = "http://192.168.1.69/api_login_flutter/obtenerUsuario.php";
    final response = await http.post(url, body: {
      "usuario": controlUsuario.text,
      "contrasena": controlContrasena.text
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/log8.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: WillPopScope(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 5, top: 50, right: 5),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/more.jpg"),
                          //image: new NetworkImage("https://i.imgur.com/BoN9kdC.png")
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 50, top: 25, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            controller: controlUsuario,
                            obscureText: false,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              labelText: "USUARIO",
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            controller: controlContrasena,
                            obscureText: true,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              labelText: "CONTRASEÑA",
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
                      //padding: EdgeInsets.all(50),
                      child: SizedBox(
                        width: 480.0,
                        height: 45.0,
                        child: btnEntra(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
                      //padding: EdgeInsets.all(50),
                      child: SizedBox(
                        width: 480.0,
                        height: 45.0,
                        child: btnRegis(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          onWillPop: () async {
            return false;
          }
        ),
      ),
    );
  }

  Widget btnRegis(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.blue),
      ),
      onPressed: () => showModalBottomSheet(
        context: context, builder: (ctx) => BottomSheetExample()
      ),
      icon: Icon(Icons.group_add, color: Colors.white,size: 22,), 
      label: Text("Registrarse", style: TextStyle(color: Colors.white, fontSize: 22),),
      color: Colors.blue,
    );
  }

  Widget  btnEntra(){
    return RaisedButton.icon(
      onPressed: (){
        obtenerUsuario();
      }, 
      icon: Icon(Icons.touch_app, color: Colors.white,size: 22,), 
      label: Text("Inicia sesion", style: TextStyle(color: Colors.white, fontSize: 22),),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.green,)
      ),
      color: Colors.green,
    );
  }

  Widget btnEntrar() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.green),
      ),
      color: Colors.green,
      textColor: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.touch_app,
              color: Colors.white,
            ),
            Text(
              "INICIAR SESION",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        obtenerUsuario();
      },
    );
  }

  
}
