// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

// Importaciones personalizadas
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icono_string_util.dart';
// import 'package:components/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _list(),
    );
  }

  Widget _list() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createListItems(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
    final List<Widget> widgets = data.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item['texto']),
            leading: getIcon(item['icon']),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {
              // final route = MaterialPageRoute(builder: (context) => AlertPage());
              // Navigator.push(context, route);
              Navigator.pushNamed(context, item['ruta']);
            },
          ),
          // Divider(color: Colors.black,)
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }
}