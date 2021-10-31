import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nutriapp/buscador.dart';
import 'package:nutriapp/recipe.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'buscador.dart';
import 'lista_hist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Historial de Busquedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String busqueda = "";
  String search = "banana";
  int currentScreen=0;
  List<String> miHistorial = [];

  Future<List<Recipe>> ?_listaRecipe;
  Future<List<Recipe>> _getRecipes(String aliment)async{
    final response = await http.Client().get(Uri.parse(
        "https://api.spoonacular.com/food/ingredients/search?query=$aliment&number=10&apiKey=77da9e1c9fa44336bd5dfeaf2dec531b"));

    var result;
    if (response.statusCode == 200) {
      var jsonData = response.body;
      result = json.decode(jsonData);
      print(result["results"]);
      List<Recipe> recetas=[];
      for(var item in result["results"]){
        recetas.add(Recipe(item["id"],item["name"],item["image"]));
      }
      print('Resultados:\n');
      for(int i=0; i < recetas.length;i++){
        print('${recetas[i].id} ${recetas[i].name} ${recetas[i].image}');
        
      }
    return recetas;
    } else {
      throw Exception("No funcionó el llamado a la api");
    }
    
  }

  Future getAllData() async {
    var data = await Api().getNutrition("apple");
  }

  Future<void> getHistorial()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    miHistorial = (prefs.getStringList('_keyHistorial') ?? []);
    print('captado $miHistorial');
  }

  @override
  void initState() {
    super.initState();
    //getAllData();
    _listaRecipe = _getRecipes(search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: currentScreen==0 ? BuscadorPage() : ListaHistorial(miHistorial),
        bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          getHistorial();
          setState(() {
            currentScreen=index;
          });  
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],

      ),
        );
  }
}
