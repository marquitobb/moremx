import 'package:flutter/material.dart';

class BottomSheetExample extends StatefulWidget {
  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  // GlobalKey is needed to show bottom sheet.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //TextField controller
  TextEditingController correoRegis = TextEditingController();
  TextEditingController userRegis = TextEditingController();
  TextEditingController passRegis = TextEditingController();
  //Icon buttoon change
  Icon block = Icon(Icons.lock);
  bool see = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //height: 1000,
        //width: 500,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 0.0),
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.white70,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Registrate',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                controller: correoRegis,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: IconButton(icon: Icon(Icons.email), onPressed: (){}),
                  labelText: 'Ingresar el email',
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                controller: userRegis,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: IconButton(icon: Icon(Icons.supervisor_account), onPressed: (){}),
                  labelText: 'ingresa usuario',
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                controller: passRegis,
                keyboardType: TextInputType.visiblePassword,
                obscureText: see,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: IconButton(
                    icon: block,
                    onPressed: () {
                      if (this.block.icon == Icons.lock) {
                        this.block = Icon(Icons.lock_open);
                        this.see = false;
                      }else{
                        this.block = Icon(Icons.lock);
                        this.see = true;
                      }
                    },
                  ),
                  //icon: Icon(Icons.lock_open),
                  labelText: 'ingresa contraseña',
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                alignment: Alignment.center,
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  color: Colors.blue,
                  label: Text(
                    'Registrate',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
