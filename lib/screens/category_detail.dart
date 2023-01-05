import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: List<Widget>.generate(30, (i) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              // onTap: () => context
              //           .push('${ScreenPaths.home}/${ScreenPaths.category(item)}'),
              onTap: () => context.pushNamed('productDetailt',
                  params: {'category': category, 'id': i.toString()}),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe0e0e0),
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 2),
                        BoxShadow(
                            color: Color(0xff9e9e9e),
                            offset: Offset(-4, -4),
                            blurRadius: 10,
                            spreadRadius: 2),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "$category $i",
                          textAlign: TextAlign.left,
                        )),
                  )),
            ),
          );
        }),
      ),
    );
  }
}
