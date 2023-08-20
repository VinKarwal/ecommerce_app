import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

@immutable
abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}

class LoadWishlist extends WishlistEvent {
  @override
  List<Object?> get props => [];
}

class AddWishlistProduct extends WishlistEvent {
  final Product product;

  const AddWishlistProduct({required this.product});

  @override
  List<Object?> get props => [product];
}

class RemoveProductFromWishlist extends WishlistEvent {
  final Product product;

  const RemoveProductFromWishlist({required this.product});

  @override
  List<Object?> get props => [product];
}

