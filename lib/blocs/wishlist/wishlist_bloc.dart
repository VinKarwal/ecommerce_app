import 'package:ecommerce_app/blocs/wishlist/wishlist_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddWishlistProduct>(_onAddWishlistProduct);
    on<RemoveProductFromWishlist>(_onRemoveWishlistProduct);
  }

  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (_) {}
  }

  void _onAddWishlistProduct(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
          ),
        ));
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveWishlistProduct(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        ));
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}
