import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  final Cart cart;

  const LoadCart({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

class AddProduct extends CartEvent {
  final Product product;

  const AddProduct({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveProduct extends CartEvent {
  final Product product;

  const RemoveProduct({required this.product});

  @override
  List<Object> get props => [product];
}
