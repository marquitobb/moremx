import 'package:flutter/material.dart';
import 'package:moremx/pages/body.dart';
import 'package:moremx/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Icon cusIcon = Icon(Icons.search);
  Widget cusSerchBar = Text("moreMX", style: TextStyle(color: Colors.white),);
  String busText = "";
  //TextEditingController busqueda = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        title: cusSerchBar,
        actions: <Widget>[
          IconButton(
            icon: cusIcon,
            color: Colors.white,
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSerchBar = TextField(
                    //controller: busqueda,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "busca aqui",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    onSubmitted: (busText){
                      print(busText);
                    },
                  ); 
                  
                }else{
                  this.cusIcon = Icon(Icons.search);
                  this.cusSerchBar = Text("moreMX", style: TextStyle(color: Colors.white),);
                  
                }
                
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {},
          )
        ],
        /*bottom: PreferredSize(
          child: Container(

          ),
          preferredSize: Size(50,50),
        ),*/
      ),
      drawer: jiji(),
      body: Cuerpo(),
    );
  }
}
