import 'package:flutter/material.dart';
import 'package:spud_sports/screens/menu.dart';
import 'package:spud_sports/screens/add_product_form.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),

            child: Column(
              children: [
                Text(
                  'spuD Sports',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                Padding(padding: EdgeInsets.all(10)),

                Text(
                  'The place for all sports related e-commerce!',
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ]
            ),
          ),

          //routing to Home Page
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),

          //routing to Add Product page
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Product'),

            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProductFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
