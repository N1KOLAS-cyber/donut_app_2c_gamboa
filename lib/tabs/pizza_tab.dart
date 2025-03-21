import 'package:donut_app_2c_gamboa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final Function(double) onAdd; // Callback para agregar al carrito

  // Lista de pizzas en venta
  final List<List<dynamic>> donutsOnSale = [
    // [donutFlavor, donutStore, donutPrice, donutColor, imageName]
    ["Volcanic", "Joe pizza", "140", Colors.blue, "lib/images/pizza_1.png"],
    ["Mountaineer","La fogatta Plus","195", Colors.red,"lib/images/pizza_2.png"],
    ["Four seasons", "Fastas's", "165", Colors.purple, "lib/images/pizza_3.png"],
    ["Grean Dream", "Dominos", "210", Colors.brown, "lib/images/pizza_4.png"],
    ["Tex Mex", "Pizza y corre", "220", Colors.blue, "lib/images/pizza_5.png"],
    ["Black Truffle", "Trattoria la pasta", "100", Colors.red, "lib/images/pizza_6.png"],
    ["Sweet Truffle", "Messinas", "155", Colors.purple, "lib/images/pizza_8.png"],
    ["Sweet Templation", "Don queso", "175", Colors.brown, "lib/images/pizza_9.png"],
  ];

  // Constructor que recibe la función de callback
  PizzaTab({super.key, required this.onAdd});

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
