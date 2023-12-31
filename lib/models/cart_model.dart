import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(product) {
    var quantity = Map();

    products.forEach((product) {
      if(!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    },
    );
    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0;
    } else {
      return 5.99;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
