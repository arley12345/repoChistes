import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:prueba/src/pages/home_page.dart';
import 'package:prueba/src/providers/chiste_provide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => ChisteProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JSONPlaceholder Users',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserListScreen(),
    ),
    );
  }
}

