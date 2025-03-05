import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  //Es dynamic porque puede ser de tipo COLOR
  final dynamic donutColor;
  final String imageName;

  const DonutTile({super.key, required this.donutFlavor, required this.donutPrice, this.donutColor, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[50],
         borderRadius: BorderRadius.circular(24)
        ),
        child: Column(children: [
          //PriceTag
          Row( mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
              decoration: BoxDecoration(
                color: donutColor[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 18,
              ),
              child: Text("\$$donutPrice", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: donutColor[900],
              ),
              ),
              ),
            ],
            ),
          //Donut Picture
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Image.asset(imageName),
          ),

          //Donut Flavor Text

          //Boutton
        ],),
      ),
    );
  }
}