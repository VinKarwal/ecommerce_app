import 'package:ecommerce_app/API/product_api_provider.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../components/widgets.dart';

class CatalogPage extends StatelessWidget {
  static const String routeName = '/catalog';
  final Category1 category;

  const CatalogPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // final List<Product> categoryProducts = Product.products
    //     .where((product) => product.category == category.name)
    //     .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomNavBar(),
      body: FutureBuilder<List<Product>>(
        future:
            ProductApiProvider().fetchProducts(), // Fetch products from the API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error fetching category products');
          } else if (snapshot.hasData) {
            final categoryProducts = snapshot.data!
                .where((product) => product.category == category.name)
                .toList();
            return 
            GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    product: categoryProducts[index],
                    widthFactor: 2.2,
                  ),
                );
              },
            );
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}
