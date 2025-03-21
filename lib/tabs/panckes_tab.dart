import 'package:donut_app_2c_gamboa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PancakesTab extends StatelessWidget {
  final Function(double) onAdd; // Callback para agregar al carrito

  // Lista de pancakes en venta
  final List<List<dynamic>> donutsOnSale = [
    // [donutFlavor, donutStore, donutPrice, donutColor, imageName]
    ["BlueberriesCherries","Mac Donalds","85",Colors.blue,"lib/images/pancake_1.png"],
    ["Chocolate with Cream","Impala","55",Colors.red,"lib/images/pancake_2.png"],
    ["Chocolate chip jam","¡Hop","74",Colors.purple,"lib/images/pancake_3.png"],
    ["Chocolate with butter", "coffe shopp", "65", Colors.brown, "lib/images/pancake_4.png"],
    ["with butter","Don Mosso","103",Colors.blue,"lib/images/pancake_5.png"],
    ["Jam with blueberries", "Trecaffe ", "130", Colors.red, "lib/images/pancake_6.png"],
    ["strawberry", "Dari Hotcake", "110", Colors.purple, "lib/images/pancake_7.png"],
    ["Casero", "Nico's Brunch", "95", Colors.brown, "lib/images/pancake_8.png"],
  ];

  // Constructor que recibe la función de callback
  PancakesTab({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    // Widget para usar cuadrícula
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
      ),
      itemBuilder: (context, index) {
        // Cada elemento individual
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
      },
    );
  }
}
