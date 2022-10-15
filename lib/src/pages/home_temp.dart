import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  // const HomePageTemp({Key key}) : super(key: key);

  final opciones = ['Uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
        body: ListView(
          children: _createListItems(),
        ),
      ),
    );
  }

  // List<Widget> _createItems() {
  //   List<Widget> lista = new List<Widget>();

  //   for (String item in opciones) {
  //     final tempWidget = ListTile(title: Text(item));
  //     lista..add(tempWidget)
  //          ..add(Divider(color: Colors.black));
  //   }
  //   return lista;
  // }

  List<Widget> _createListItems() {
    return opciones.map((opcion) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opcion),
            subtitle: Text('Lorem ipsum'),
            leading: Icon(Icons.alarm_off),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(color: Colors.black)
        ],
      );
    }).toList();
  }
}