import 'package:flutter/material.dart';
import 'package:moremx/pages/login.dart';
//import 'package:shopapp/ruta2/pag2.dart';

class jiji extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Colors.red, backgroundBlendMode: BlendMode.darken),
            accountName: Text("marco cobian"),
            accountEmail: Text("maca@gmail.com"),
            arrowColor: Colors.red,
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.yellow,
                //https://media.licdn.com/dms/image/C5603AQFRICYMz6W7qQ/profile-displayphoto-shrink_200_200/0?e=1583971200&v=beta&t=ejyQjbBfu75ad8YOD5bsmwl-Z8ZIOUOLycbMCgneXZQ
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://scontent.fgdl5-1.fna.fbcdn.net/v/t1.0-9/60356237_2187259624656555_2494916055223238656_n.jpg?_nc_cat=101&_nc_sid=09cbfe&_nc_ohc=Tmw1bAgF_EsAX-o1PVI&_nc_ht=scontent.fgdl5-1.fna&oh=e120dc48143d6fc59f742ffa2655426f&oe=5EAC2AA6",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Home Page"),
            leading: Icon(
              Icons.home,
              color: Colors.pink,
            ),
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => pagDos(text: "uno",)));
            },
          ),
          ListTile(
            title: Text("My account"),
            leading: Icon(
              Icons.account_circle,
              color: Colors.teal,
            ),
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => pagDos(text: "dos",)));
            },
          ),
          ordernes(context),
          categorias(context),
          fav(context),
          Divider(),
          salir(context),
          sobre(context)
        ],
      ),
    );
  }

  Widget ordernes(BuildContext context) {
    return ListTile(
      title: Text("My orders"),
      leading: Icon(
        Icons.local_mall,
        color: Colors.green,
      ),
      onTap: () {},
    );
  }

  Widget salir(BuildContext context) {
    return ListTile(
      title: Text("Exit"),
      leading: Icon(
        Icons.exit_to_app,
        color: Colors.black54,
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
  }

  Widget categorias(BuildContext context) {
    return ListTile(
      title: Text("Categories"),
      leading: Icon(
        Icons.category,
        color: Colors.yellow,
      ),
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => pagDos(text: "dos",)));
      },
    );
  }

  Widget fav(BuildContext context) {
    return ListTile(
      title: Text("Favorites"),
      leading: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => pagDos(text: "dos",)));
      },
    );
  }

  Widget sobre(BuildContext context) {
    return ListTile(
      title: Text("About"),
      leading: Icon(
        Icons.help,
        color: Colors.blue,
      ),
    );
  }
}
