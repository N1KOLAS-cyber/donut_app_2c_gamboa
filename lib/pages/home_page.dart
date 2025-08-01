import 'package:donut_app_2c_gamboa/tabs/bugger_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/donut_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/lia_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/panckes_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/pizza_tab.dart';
import 'package:donut_app_2c_gamboa/tabs/smoothie_tab.dart';
import 'package:donut_app_2c_gamboa/utils/my_tab.dart';
import 'package:donut_app_2c_gamboa/pages/supermarket_page.dart'; // Asegúrate de tener esta importación
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemCount = 0;
  double totalCost = 0;

  void addItem(double price) {
    setState(() {
      itemCount++;
      totalCost += price;
    });
  }

  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png'),
    MyTab(iconPath: 'lib/icons/burger.png'),
    MyTab(iconPath: 'lib/icons/burger .png'),
    MyTab(iconPath: 'lib/icons/smoothie.png'),
    MyTab(iconPath: 'lib/icons/pancakes.png'),
    MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        // ✅ AppBar con icono de menú funcional
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),

        // ✅ Drawer funcional
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 113, 148),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.store),
                title: const Text('SuperMarket'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuperMarketPage()),
                  );
                },
              ),
            ],
          ),
        ),

        body: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              children: [
                Text(
                  "I want to ",
                  style: TextStyle(fontSize: 32),
                ),
                Text(
                  "Eat",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          ),

          TabBar(tabs: myTabs),

          Expanded(
            child: TabBarView(children: [
              DonutTab(onAdd: addItem),
              BurgerTab(onAdd: addItem),
              SmoothieTab(onAdd: addItem),
              PancakesTab(onAdd: addItem),
              PizzaTab(onAdd: addItem),
              LiaTab(onAdd: addItem),
            ]),
          ),

          Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$itemCount Items | \$${totalCost.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "Delivery Chargers Included",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12)),
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'View Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ]))
        ]),
      ),
    );
  }
}
