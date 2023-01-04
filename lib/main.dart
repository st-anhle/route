import 'package:flutter/material.dart';
import 'package:go_route/app.dart';
import 'package:go_route/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      // routerDelegate: appRouter.routerDelegate,
      // routeInformationProvider: appRouter.routeInformationProvider,
      // routeInformationParser: appRouter.routeInformationParser,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
