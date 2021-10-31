import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class pantallaPrincipal extends StatefulWidget {
  pantallaPrincipal({Key? key}) : super(key: key);

  @override
  _pantallaPrincipalState createState() => _pantallaPrincipalState();
}

class _pantallaPrincipalState extends State<pantallaPrincipal> {

  Material myItem(String ruta,double alto,double ancho){
    return Material(
      color: Colors.white38,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24),
      child: Card(
        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                      ),
        elevation: 4.0,
        child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Container(
                          child: FadeInImage(
                            placeholder: NetworkImage('https://res.cloudinary.com/dyfklal09/image/upload/v1594435785/Dev%20TR/loading_lu25y4.gif'),
                            image: NetworkImage(ruta),
                            fit: BoxFit.cover,
                            ),
                        ),
                      ),
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size tam = MediaQuery.of(context).size;
    double ancho=tam.width;
    double alto =tam.height;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: alto*0.03,
            mainAxisSpacing: alto*0.03,
            padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
            children: [
              myItem('https://i.ibb.co/QjzwtVJ/bg-1.jpg',alto,ancho),
              myItem('https://i.ibb.co/LzVd2VD/Rainbow-fruits-berries-background-on-white-Top-view-of-strawberries-blueberries-cherries-mango-apple.jpg',alto,ancho),
              myItem('https://i.ibb.co/MC8K8c4/bg-fruta-5-2.jpg',alto,ancho),
            ],
            staggeredTiles: [
              StaggeredTile.extent(2, alto*0.35),
              StaggeredTile.extent(1, alto*0.40),
              StaggeredTile.extent(1, alto*0.40),
            ],
          )
        ),
      ),
    );
  }
}
