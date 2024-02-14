import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/wishlist_data_list.dart';
import 'package:meta/meta.dart';

import '../../model/product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishlistItemRemoveEvent>(wishlistItemRemoveEvent);
  }

  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) async{
    emit(WishlistLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(WishlistSuccessState(wishListItems: wishListItems));


  }

  FutureOr<void> wishlistItemRemoveEvent(WishlistItemRemoveEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishListItems: wishListItems));
  }
}
