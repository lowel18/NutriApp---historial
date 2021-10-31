class Recipe {
  int id;
  String name;
  String image;

  Recipe(this.id, this.name, this.image);

  /*factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(json["id"], json["name"], json["image"]);
  }*/
}
