import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  
  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final menuJson = await rootBundle.loadString('data/menu_opts.json');
    Map menuData = json.decode(menuJson);
    opciones = menuData['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();