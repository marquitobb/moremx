import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Categorias(
            image_location: 'assets/categorias/tshirt.png',
            image_caption: 'shirt',
          ),
          Categorias(
            image_location: 'assets/categorias/dress.png',
            image_caption: 'dress',
          ),
          Categorias(
            image_location: 'assets/categorias/jeans.png',
            image_caption: 'pants',
          ),
          Categorias(
            image_location: 'assets/categorias/formal.png',
            image_caption: 'formal',
          ),
          Categorias(
            image_location: 'assets/categorias/informal.png',
            image_caption: 'informal',
          ),
          Categorias(
            image_location: 'assets/categorias/shoe.png',
            image_caption: 'shoe',
          ),
          Categorias(
            image_location: 'assets/categorias/accessories.png',
            image_caption: 'shoe',
          ),
          
          
        ],
      ),
    );
  }
}

class Categorias extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Categorias({
    this.image_location,
    this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: TextStyle(fontSize: 12.0),),
            ),
          ),
        ),
      ),
    );
  }
}
