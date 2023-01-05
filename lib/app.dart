import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_route/screens/Profile.dart';
import 'package:go_route/screens/category.dart';
import 'package:go_route/screens/shopping_cart.dart';
import 'package:go_router/go_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedpage = 0;
  final _listPage = [HomePage(), const ShoppingCard(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: _listPage[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home),
          TabItem(
            icon: Icons.shopping_cart,
          ),
          TabItem(
            icon: Icons.people,
          ),
        ],
        initialActiveIndex: selectedpage,
        onTap: (int index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}
