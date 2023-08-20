import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/widgets.dart';

class WishListPage extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "WishList"),
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.4,
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor: 1.1,
                    leftPosition: 100,
                    isWishlist: true,
                  ),
                );
              },
            );
          } else {
            return const Text("Something went wrong!");
          }
        },
      ),
    );
  }
}


// BlocBuilder<WishlistBloc, WishlistState>(
//         builder: (context, state) {
//           if (state is WishlistLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state is WishlistLoaded) {
//             return GridView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 childAspectRatio: 2.4,
//               ),
//               itemCount: state.wishlist.products.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Center(
//                   child: ProductCard(
//                     product: state.wishlist.products[index],
//                     widthFactor: 1.1,
//                     leftPosition: 100,
//                     isWishlist: true,
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Text("Something went wrong!");
//           }
//         },
//       ),