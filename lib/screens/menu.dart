import 'package:flutter/material.dart';
import 'package:spud_sports/widgets/side_drawer.dart';
import 'package:spud_sports/widgets/menu_card.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  ItemHomepage(this.name, this.icon, this.color);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.store, Colors.blue),
    ItemHomepage("My Products", Icons.inventory, Colors.green),
    ItemHomepage("Create Product", Icons.add_box, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'spuD Sports',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          //3 column grid
          child: GridView.count(
            primary: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            shrinkWrap: true,
            children: items.map((item) => ItemCard(item)).toList(),
          ),
        ),
      ),
    );
  }
}