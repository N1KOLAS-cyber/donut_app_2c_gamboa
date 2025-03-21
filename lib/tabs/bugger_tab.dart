import 'package:donut_app_2c_gamboa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final Function(double) onAdd; // Callback para agregar al carrito

  final List donutsOnSale = [
    //[donutFlavor,donutPrice,donutColor,ImageName]

    [ "Cheese Bugger", "Wildest Burgger","129", Colors.blue,"lib/images/Hamburguesa 1.png"],
    [ "Classic Burgger","Burgger King","139", Colors.red,"lib/images/Hamburguesa 2.png" ],
    [ "La merge Burgguer", "Cars Jr's", "99",Colors.purple,"lib/images/Hamburguesa 3.png"],
    [ "Grill Master", "Wendys","179", Colors.brown,"lib/images/Hamburguesa 4.png"],
    [ "Mitica Burgguer","Brayan's Burguer Bar","179", Colors.blue,"lib/images/Hamburguesa 5.png"],
    [ "Cheesebomb burgguer","Mac Donalds","119",Colors.red,"lib/images/Hamburguesa 6.png"],
    [ "vaquero Burgguer","Home Burgguer","210", Colors.purple,"lib/images/Hamburguesa 7.png" ],
    ["Buffalo Burgguer","Home NG", "215", Colors.brown, "lib/images/Hamburguesa 8.png"],

    
  ];
  BurgerTab({super.key, required this.onAdd});
  @override
  Widget build(BuildContext context) {
    //Widget para usar cuadicula
    return GridView.builder(
        //cuantos elementos hay en la regilla
        itemCount: donutsOnSale.length,
        //espacio entre texto
        padding: EdgeInsets.all(12),
        //Prepa 1. como se distuibiran los elementos
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //crosaxis en una fila el eje crusado es el vertical
            crossAxisCount: 2,
            //relacion de aspecto(Proporcion)
            childAspectRatio: 1 / 1.6),
        itemBuilder: (context, index) {
          //cada elemento individual
          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutStore: donutsOnSale[index][1],
            donutPrice: donutsOnSale[index][2],
            donutColor: donutsOnSale[index][3],
            imageName: donutsOnSale[index][4],
            onAdd: () {
              // Llama a la función de callback y pasa el precio
              onAdd(double.parse(donutsOnSale[index][2]));
            },
          );
        });
  }
}
