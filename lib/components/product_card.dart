import 'package:ecommerce_app/blocs/cart/cart_event.dart';
import 'package:ecommerce_app/blocs/cart/cart_state.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_bloc.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    super.key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor -
                  5 -
                  leftPosition,
              height: 80,
              decoration: BoxDecoration(color: Colors.green.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor -
                  15 -
                  leftPosition,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            '\$${product.price}',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                      AddProduct(product: product),
                                    );
                                const snackBar = SnackBar(
                                    content: Text("Added to your Cart!"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: const Icon(
                                Icons.add_circle_rounded,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else {
                          return const Text('Something went wrong!');
                        }
                      },
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              onPressed: () {
                                const snackBar = SnackBar(
                                    content:
                                        Text("Removed from your Wishlist!"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                context.read<WishlistBloc>().add(
                                    RemoveProductFromWishlist(
                                        product: product));
                              },
                              icon: const Icon(
                                Icons.delete_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}