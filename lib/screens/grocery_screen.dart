import 'package:flutter/material.dart';
import 'empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GroceryManager>(
      // 2
      builder: (context, manager, child) {
        // 3
        if (manager.groceryItems.isNotEmpty) {
          // TODO 25: Add GroceryListScreen
          return Container();
        } else {
          // 5
          return Scaffold(
            // 6
            body: EmptyGroceryScreen(),

            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                // 1
                final manager =
                    Provider.of<GroceryManager>(context, listen: false);
                // 2
                Navigator.push(
                  context,
                  // 3
                  MaterialPageRoute(
                    // 4
                    builder: (context) => GroceryItemScreen(
                      // 5
                      onCreate: (item) {
                        // 6
                        manager.addItem(item);
                        // 7
                        Navigator.pop(context);
                      },
                      // 8
                      onUpdate: (item) {},
                    ),
                  ),
                );
              },
            ), // 7
          );
        }
      },
    );
  }
}
