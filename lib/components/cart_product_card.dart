import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_event.dart';
import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(RemoveProduct(product: product));
                      },
                      icon: Icon(Icons.remove_circle_rounded)),
                  Text(
                    quantity.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(AddProduct(product: product));
                      },
                      icon: Icon(Icons.add_circle_rounded)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
