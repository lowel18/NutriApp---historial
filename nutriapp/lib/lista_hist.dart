import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
/*
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
}*/

class ListaHistorial2 extends StatefulWidget {
  ListaHistorial2({Key? key}) : super(key: key);

  @override
  _ListaHistorial2State createState() => _ListaHistorial2State();
}

class _ListaHistorial2State extends State<ListaHistorial2> {
  
  List<String>miHistorial=[];

  Future<void> getHistorial()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> aux = (prefs.getStringList('_keyHistorial') ?? []);
    //print('captado en Lista_historial $miHistorial');
    setState(() {
      miHistorial=aux;
    });
  }

  borrar(int index){
    int num = miHistorial.length;
    setState(() {
      miHistorial.removeAt(num-index-1);
    });
  }

  int arreglo(){
    getHistorial();
    print('arr: $miHistorial');
    return miHistorial.length;
  }

  @override
  void initState() {
    //getHistorial();
    super.initState();
    //getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                        //reverse: true,
                        itemCount: arreglo(),
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
