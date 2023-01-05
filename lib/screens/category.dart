import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> listCategory = [
    "Watch",
    "Clothing",
    "Beauty",
    "Book",
    "Groceries",
    "Kitchen",
    "Book",
    "Toys",
    "Outdoor",
    "Cleaning"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Category',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 73, 69, 69)),
            ),
          ),
          SizedBox(
              height: 200,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                children: listCategory.map((item) {
                  return InkWell(
                    onTap: () => context
                        .pushNamed('category', params: {'category': item}),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
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
                        child: Center(
                          child: Text(item),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
        ],
      ),
    );
  }
}
