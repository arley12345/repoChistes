import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba/src/models/chiste.dart';

import '../globals/enviroment.dart';

class ChisteServices {
    List<Chiste> _chiste = [];
    
    Future<List<Chiste>> fetchJokes() async {
    List<String> jokes = [];
    for (int i = 0; i < 20; i++) {
      final response = await http.get(Uri.parse(Enviroment.rutApiUsers));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        jokes.add(json['value']);
        _chiste.add(Chiste.fromJson(json));
      } else {
        jokes.add("Failed to load joke!");
      }
    }
    return _chiste;
  }
}