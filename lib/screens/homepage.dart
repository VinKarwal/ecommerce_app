import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/API/product_api_provider.dart';
import 'package:flutter/material.dart';
import '../components/widgets.dart';
import '../models/models.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home';

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Grocery Store"),
      bottomNavigationBar: const CustomNavBar(),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category1.categories
                  .map((Category1) => HeroCarouselCard(category: Category1))
                  .toList(),
            ),
            const SizedBox(height: 20.0),
            const SectionTile(title: "RECOMMENDED"),
            FutureBuilder<List<Product>>(
              future: ProductApiProvider().fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final recommendedProducts = snapshot.data!
                      .where((product) => product.isRecommended)
                      .toList();
                  return RecommendedScroll(products: recommendedProducts);
                } else if (snapshot.hasError) {
                  return Text('Error fetching recommended products');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            // RecommendedScroll(
            //     products: Product.products
            //         .where((product) => product.isRecommended)
            //         .toList()),
            const SectionTile(title: "MOST POPULAR"),
            FutureBuilder<List<Product>>(
              future: ProductApiProvider().fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final popularProducts = snapshot.data!
                      .where((product) => product.isPopular)
                      .toList();
                  return RecommendedScroll(products: popularProducts);
                } else if (snapshot.hasError) {
                  return Text('Error fetching popular products');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            // RecommendedScroll(
            //     products: Product.products
            //         .where((product) => product.isPopular)
            //         .toList()),
          ],
        ),
      ),
    );
  }
}
