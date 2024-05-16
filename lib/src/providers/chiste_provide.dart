import 'package:flutter/material.dart';
import 'package:prueba/src/models/chiste.dart';

import '../services/chiste_services.dart';

class ChisteProvider extends ChangeNotifier{
  List<Chiste>? chiste;

  Future<List<Chiste>?> getUsers() async {
    if (chiste != null) {
      return chiste;
    }

    var service = new ChisteServices();
    this.chiste = await service.fetchJokes();
    notifyListeners();
    return chiste;
  }
}