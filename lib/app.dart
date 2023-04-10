import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
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
  int selectedPage = 0;
  final _listPage = <Widget>[HomePage(), const ShoppingCard(), const Profile()];

  @override
  void initState() {
    super.initState();
    initLink();
  }

  initLink() async {
    // Get any initial links
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      context.pushNamed('category', params: {'category': 'Watch'});
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      context.pushNamed('category', params: {'category': 'Kitchen'});
    }).onError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: _listPage[selectedPage],
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
        initialActiveIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
