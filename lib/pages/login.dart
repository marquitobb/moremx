import 'package:flutter/material.dart';
import 'package:moremx/pages/inicio.dart';
import 'package:moremx/pages/registrar.dart';
import 'package:moremx/widgets/futures/futuLogin.dart';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

//stateful login
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controlUsuario = new TextEditingController();
  TextEditingController controlContrasena = new TextEditingController();

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
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              labelText: "Email",
                              icon: Icon(
                                Icons.email,
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
                            keyboardType: TextInputType.visiblePassword,
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
  //Registrer Button
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
  //Login Button 
  Widget  btnEntra(){
    return RaisedButton.icon(
      onPressed: (){
        String email = controlUsuario.text;
        String pass = controlContrasena.text;
        obtenerUser(context, email, pass);
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
  
}
