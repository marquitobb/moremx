import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:moremx/components/horizontal_listview.dart';
import 'package:moremx/pages/login.dart';

class Cuerpo extends StatefulWidget {
  @override
  _CuerpoState createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  //boxtext para salir
  Future<bool> _onBackPPressend() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("salir"),
            content: Text("desea salir de la app"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('no'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('si'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          ExactAssetImage('assets/d2.jpg'),
          ExactAssetImage('assets/d3.jpg'),
          ExactAssetImage('assets/d4.jpg'),
          ExactAssetImage('assets/d5.jpg'),
          ExactAssetImage('assets/d6.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 3000),
        autoplayDuration: Duration(milliseconds: 3000),
        dotSize: 6.0,
        dotIncreasedColor: Color(0xFFFF335C),
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.topRight,
        dotVerticalPadding: 10.0,
        showIndicator: true,
        indicatorBgPadding: 7.0,
        onImageTap: (int a) {
          print(a);
        },
        /*autoplay: true,
        showIndicator: true,
        animationCurve: Curves.linearToEaseOut,
        autoplayDuration: Duration(seconds: 8),
        //animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        */
      ),
    );

    return Scaffold(
      body: WillPopScope(
        child: ListView(
          children: <Widget>[
            image_carousel,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("categorias"),
            ),
            HorizontalList(),
          ],
        ),
        onWillPop: _onBackPPressend,
      ),
    );
  }
}
