import 'package:ecommerce_app/auth/auth_page.dart';
import 'package:ecommerce_app/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print("This is the route: ${settings.name}");

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthPage());
      case MyHomePage.routeName:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case CartPage.routeName:
        return MaterialPageRoute(builder: (_) => CartPage());
      case CatalogPage.routeName:
        return MaterialPageRoute(
            builder: (_) => CatalogPage(
                  category: settings.arguments as Category1,
                ));
      case ProductPage.routeName:
        return MaterialPageRoute(
            builder: (_) => ProductPage(
                  product: settings.arguments as Product,
                ));
      case WishListPage.routeName:
        return MaterialPageRoute(builder: (_) => WishListPage());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case CreateProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => CreateProfilePage());

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
