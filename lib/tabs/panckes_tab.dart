import 'package:donut_app_2c_gamboa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PanckesTab extends StatelessWidget {

  //lista de donas
    final List donutsOnSale = [

   // [ donutFlavor, donutPrice, donutColor, imageName ]
   ["Ice Cream","Aurrrera","36", Colors.blue, "lib/images/icecream_donut.png"],
   ["Strawberry","Costco", "45", Colors.red, "lib/images/strawberry_donut.png"],
   ["Grape Ape","Donkin Donuts", "84", Colors.purple, "lib/images/grape_donut.png"],
   ["Choco","Krispy king", "95", Colors.brown, "lib/images/chocolate_donut.png"],
   ["Ice Cream","Aurrrera","36", Colors.blue, "lib/images/icecream_donut.png"],
   ["Strawberry","Costco", "45", Colors.red, "lib/images/strawberry_donut.png"],
   ["Grape Ape","Donkin Donuts", "84", Colors.purple, "lib/images/grape_donut.png"],
   ["Choco","Krispy king", "95", Colors.brown, "lib/images/chocolate_donut.png"],


  ]; 
  PanckesTab({super.key});

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
        //espacio entre columnas  
        childAspectRatio: 1/1.65,
      ),
      itemBuilder: (context, index) { 
         //cada elemento de individual
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutStore: donutsOnSale[index][1],
          donutPrice: donutsOnSale[index][2],
          donutColor: donutsOnSale[index][3],
          imageName: donutsOnSale[index][4],
        );
      } 
    );
  }
}