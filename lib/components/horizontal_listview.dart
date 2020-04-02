import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[],
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
        onTap: (){},
        child: ListTile(
          title: Image.asset(image_location),
          subtitle: Text(image_caption),
        ),
      ),
    );
  }
}
