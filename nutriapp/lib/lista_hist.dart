import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ListaHistorial extends StatelessWidget {
  final List<String> miHistorial;
  const ListaHistorial(this.miHistorial,{Key? key}) : super(key: key);

  borrar(int index){
    int num = miHistorial.length;
    miHistorial.removeAt(num-index-1);
  }

  @override
  Widget build(BuildContext context) {
    //int iterar=miHistorial.length;
    return ListView.builder(
                        //reverse: true,
                        itemCount: miHistorial.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(miHistorial[miHistorial.length-index-1].toString()),
                            trailing: IconButton
                            (onPressed: ()async{
                              
                                borrar(index);
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setStringList('_keyHistorial', miHistorial);
                                
                              
                              }, 
                            icon: Icon(Icons.close)),
                            );
                        }
                      );
  }
}
