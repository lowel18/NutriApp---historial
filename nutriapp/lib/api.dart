import 'dart:convert';

import 'package:nutriapp/recipe.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> getNutrition(String aliment) async {
    final response = await http.Client().get(Uri.parse(
        "https://api.spoonacular.com/food/ingredients/search?query=$aliment&number=10&apiKey=77da9e1c9fa44336bd5dfeaf2dec531b"));

    var result;
    if (response.statusCode == 200) {
      var jsonData = response.body;
      result = json.decode(jsonData);
      print(result["results"]);
    } else {
      throw Exception("No funcionó el llamado a la api");
    }

    return result["results"];
  }
}

