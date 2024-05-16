import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:prueba/src/models/chiste.dart';

import '../providers/chiste_provide.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ChisteProvider>(context);
    return Scaffold(      
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: FutureBuilder(
            future: userProvider.getUsers(),
            builder: (_, AsyncSnapshot<List<Chiste>?>? snapshot){
              if (snapshot!.hasData) {
                final userdata = snapshot.data;

                return ListView.builder(
                itemCount: userdata!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.all(12),
                      elevation: 10,
                      child: Column(
                        children: [
                          Row(children: [                            
                            Column(children: [
                              Row(children: [               
                            Container(
                              width: MediaQuery.of(context).size.width*0.75,
                              child: Text(userdata[index].value, style: const TextStyle(fontSize: 18),)),
                            ],),
                           
                            ],)                          
                            ],) 
                        ],   
                      ),
                    ),
                  );              
                },
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );

              }

            },


            
          ),
    );
  }
}