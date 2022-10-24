// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_order_app/modles/food_categories_modle.dart';
import 'package:food_order_app/screen/detail_page.dart';
import 'package:food_order_app/screen/home_page.dart';
import 'package:food_order_app/widget/bottom_container.dart';

class Categories extends StatelessWidget {
  List<FoodCategoriesModle> list = [];
  Categories({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (contet) => const HomePage(),
              ),
            );
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: GridView.count(
            shrinkWrap: false,
            primary: false,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: list
                .map(
                  (e) => BottomContainer(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            image: e.image,
                            name: e.name,
                            price: e.price,
                          ),
                        ),
                      );
                    },
                    image: e.image,
                    price: e.price,
                    name: e.name,
                  ),
                )
                .toList()),
      ),
    );
  }
}
