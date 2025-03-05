import 'package:donut_app_2c_gamboa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {

  //lista de donas
    final List donutsOnSale = [

   // [ donutFlavor, donutPrice, donutColor, imageName ]
   ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
   ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
   ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
   ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],

  ]; 
  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //cuantos elemntos ahi
      itemCount: donutsOnSale.length,
      padding: EdgeInsets.all(12),
      //prepa 1.  organiza como se veran los elemntos   
      gridDelegate: 
      SliverGridDelegateWithFixedCrossAxisCount(
        //cuantas columnas 
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7
      ),
      itemBuilder: (context, index) { 
         //cada elemento de individual
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
        );
      } 
    );
  }
}