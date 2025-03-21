import 'package:donut_app_2c_gamboa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final Function(double) onAdd; // Callback para agregar al carrito

  // Lista de smoothies en venta
  final List<List<dynamic>> donutsOnSale = [
    // [donutFlavor, donutStore, donutPrice, donutColor, imageName]
    ["Pitalla","Bombobute ","86",Colors.blue,"lib/images/Smoothie_1.png"],
    ["Carrot","Frottato ice","95",Colors.red,"lib/images/Smoothie_2.png"],
    ["Banana", "Frutilunch", "54", Colors.purple, "lib/images/Smoothie_3.png"],
    ["Melon", "Dulce sentido", "75", Colors.brown, "lib/images/Smoothie_4.png"],
    ["Strawberry","Fantastic smoothie","56",Colors.blue,"lib/images/Smoothie_5.png"],
    ["Watermelon", "Mango y coco","75",Colors.red,"lib/images/Smoothie_6.png"],
    ["Orange", "Mango Vintage", "45", Colors.purple, "lib/images/Smoothie_7.png"],
    ["Red Fruits", "Snacks and lunch", "100", Colors.brown, "lib/images/Smoothie_8.png"],
  ];

  // Constructor que recibe la función de callback
  SmoothieTab({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    // Widget para usar cuadrícula
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: EdgeInsets.symmetric(
          horizontal: 12, vertical: 16), // Ajuste en padding
      clipBehavior: Clip.antiAlias, // Evita que los elementos sobresalgan
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.64,
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
