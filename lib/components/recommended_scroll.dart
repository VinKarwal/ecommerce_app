import 'package:flutter/material.dart';
import '../models/models.dart';
import 'widgets.dart';

class RecommendedScroll extends StatelessWidget {
  final List<Product> products;
  const RecommendedScroll({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
          height: 165,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ProductCard(product: products[index]),
              );
            },
          )),
    );
  }
}
