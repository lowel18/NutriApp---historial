import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class BuscadorPage extends StatelessWidget {
  String temporal='';
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return ListView(
          
          children: [
            Center(
              child: Column(
                children: [
                  FloatingActionButton(onPressed: () async {
                    
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    List<String>miHistorial = (prefs.getStringList('_keyHistorial') ?? []);
                    miHistorial.add(temporal);
                    int last = miHistorial.length;
                    String ultimo = miHistorial[last - 1];
                    print('Anhadido $ultimo a $last');
                    await prefs.setStringList('_keyHistorial', miHistorial);
                    //mostrar=false;
                  }),
                  TextField(
                    
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    //maxLength: 2,

                    onChanged: (valor) {
                        temporal = valor;
                    },
                  ),
                  FloatingActionButton(onPressed: () async {
                    //mostrar=true;
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    List<String> miHistorial = (prefs.getStringList('_keyHistorial') ?? []);
                    for (int i = 0; i < miHistorial.length; i++) {
                      print(miHistorial[i].toString());
                      //Text("$miHistorial[i].toString()");
                    }
                  }),
                ],
              ),
            ),
          ],
        );
  }
}
