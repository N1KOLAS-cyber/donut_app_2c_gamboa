import 'package:donut_app_2c_gamboa/tabs/bugger_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/donut_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/panckes_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/pizza_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/smoothie_tab.dart';
import 'package:donut_app_2c_gamboa/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget>  myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png'),
    const MyTab(iconPath: 'lib/icons/burger.png'),
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    const MyTab(iconPath: 'lib/icons/pizza.png')
    ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar( 
          backgroundColor: Colors.transparent,
          //Icono Izquierdo
          leading: Icon(
          Icons.menu,
          color: Colors.grey[800]
          ),
          //Icono Derecho
          actions:const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
          children: [
        //Texto principal
         const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            child: Row(
              children: [
                Text("I want to ", 
                style: TextStyle(
                  //Tipografia 
                  fontFamily: "ComicStrip" ,
                  //Tamaño de letra
                  fontSize: 34
                )
                ),
                Text("Eat", 
                style: TextStyle(
                  //Tipografia 
                  fontFamily: "Roboto",
                  //Tamaño de letra
                  fontSize: 32,
                  //Negritas
                  fontWeight: FontWeight.bold,
                  //Subrayado
                  decoration: TextDecoration.underline
                ),)
              ],
            ),
          ),
      
      
        //Pestaña (TaBar)
        TabBar(tabs: myTabs),
        //Contenido de pestañas (TabarView)
        Expanded(
          child: TabBarView(children: [
            DonutTab(),
            BugerTab(),
            SmoothieTab(),
            PanckesTab(),
            PizzaTab(),
          ]),
        ),
        //Contenido(Cart)
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Row(
            //Esto alinia los elementos a los extremos
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.5),
                child: Column(
                  //aliniear horizontalmente  una columna
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("2 items | \$45",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ),
                    Text("Delivery Charges Include",style: TextStyle(fontSize: 12) ),
                
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(
                horizontal: 24, 
                vertical: 12
                ),
              ),
               child:Row(
                 children: [
                  Icon(Icons.shopping_cart, color: Colors.white,),
                   SizedBox(width: 8,),
                   Text("View Cart", style: TextStyle( fontWeight: FontWeight.bold,color: Colors.white),
                   ),
                 ],
               ),
          )],
          ),
        
        )
      
          ],)
      ),
    );
  }
}