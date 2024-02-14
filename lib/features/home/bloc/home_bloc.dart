import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/data/cart_data_list.dart';
import 'package:flutter_bloc_example/data/grocery_data.dart';
import 'package:flutter_bloc_example/data/wishlist_data_list.dart';
import 'package:meta/meta.dart';

import '../../model/product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistNavigateEvent>(homeProductWishlistNavigateEvent);
    on<HomeProductCartNavigateEvent>(homeProductCartNavigateEvent);
    on<HomeProductWishlistButtonClickEvent>(homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadingSuccessState(product: GroceryData.groceryProducts.map((e) => ProductDataModel
      (id: e['id'],
        name: e['name'],
        desc: e['description'],
        price: e['price'],
        imageUrl: e['imageUrl'])).toList()));
  }

  FutureOr<void> homeProductWishlistNavigateEvent(HomeProductWishlistNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Navigate Button Clicked');
    emit(HomeProductWishlistNavigateActionState());
  }

  FutureOr<void> homeProductCartNavigateEvent(HomeProductCartNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate Button Clicked');
    emit(HomeProductCartNavigateActionState());
  }


  FutureOr<void> homeProductWishlistButtonClickEvent(HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    print('PRODUCT WISHLISTED');
    wishListItems.add(event.productDataModel);
  }

  FutureOr<void> homeProductCartButtonClickEvent(HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print('PRODUCT ADDED TO CART');
    cartItems.add(event.productDataModel);
  }
}
