import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/cart/cart_event.dart';
import 'package:ecommerce_app/blocs/cart/cart_state.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_event.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/widgets.dart';
import '../models/models.dart';

class ProductPage extends StatelessWidget {
  static const String routeName = '/product';
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green.shade700,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddWishlistProduct(product: product));

                      final snackBar =
                          const SnackBar(content: Text("Added to your Wishlist!"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(
                      Icons.favorite_rounded,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade300,
                    ),
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(AddProduct(product: product));

                      final snackBar =
                          const SnackBar(content: Text("Added to your Cart!"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text(
                      "ADD TO CART",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [
              HeroCarouselCard(product: product),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.green.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              iconColor: Colors.green,
              initiallyExpanded: true,
              title: Text(
                "Product Information",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet. Rem tempore impedit est dolorem voluptate rem fugiat quisquam est tempora explicabo ut dolores accusantium sed nostrum alias qui culpa ipsa. Sed odit cumque eum consequatur ipsam nam quia omnis?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Delivery Information",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet. Rem tempore impedit est dolorem voluptate rem fugiat quisquam est tempora explicabo ut dolores accusantium sed nostrum alias qui culpa ipsa. Sed odit cumque eum consequatur ipsam nam quia omnis?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
