import 'package:flutter/material.dart';
import 'package:go_route/app.dart';
import 'package:go_route/screens/category.dart';
import 'package:go_route/screens/home.dart';
import 'package:go_route/screens/product.dart';
import 'package:go_route/screens/profile.dart';
import 'package:go_route/screens/shopping_cart.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  static String app = '/';
  static String home = "home";
  static String card = "shoppingCard";
  static String profile = "profile";
  static String category(String category) => 'category/$category';
}

final appRouter = GoRouter(routes: [
  AppRoute(ScreenPaths.app, (_) => const App(), routes: [
    AppRoute(ScreenPaths.card, (_) => const ShoppingCard()),
    AppRoute(ScreenPaths.profile, (_) => const Profile()),
    AppRoute(ScreenPaths.home, (_) => HomePage(), routes: [
      AppRoute('category/:category', name: 'category', (s) {
        return CategoryScreen(category: s.params['category'] ?? '');
      }, routes: [
        AppRoute(
          ':id',
          name: "productDetailt",
          (s) {
            return ProductDetail(
                id: s.params['id'] ?? '', name: s.params['category'] ?? '');
          },
        )
      ]),
    ]),
  ])
]);

class AppRoute extends GoRoute {
  AppRoute(
    String path,
    Widget Function(GoRouterState s) builder, {
    String? name,
    List<GoRoute> routes = const [],
  }) : super(
          path: path,
          name: name,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
            );
            return MaterialPage(child: pageContent);
          },
        );
}
