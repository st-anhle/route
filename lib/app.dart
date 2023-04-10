import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_route/route.dart';
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
  final _listPage = [HomePage(), const ShoppingCard(), const Profile()];

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
      // context.pushNamed('category', params: {'category': 'Watch'});
      deepLinkNavigate(context, initialLink.link.path);
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      deepLinkNavigate(context, dynamicLinkData.link.path);
    }).onError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed('shoppingCard');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: HomePage(),
      // bottomNavigationBar: ConvexAppBar(
      //   items: const [
      //     TabItem(icon: Icons.home),
      //     TabItem(
      //       icon: Icons.shopping_cart,
      //     ),
      //     TabItem(
      //       icon: Icons.people,
      //     ),
      //   ],
      //   initialActiveIndex: selectedPage,
      //   onTap: (int index) {
      //     setState(() {
      //       selectedPage = index;
      //     });
      //   },
      // ),
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  context.pushNamed(ScreenPaths.profile);
                  Navigator.of(context).pop();
                },
                child: const Text('Profile'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => deepLinkNavigate(context, ''),
        child: const Icon(Icons.add),
      ),
    );
  }
}
