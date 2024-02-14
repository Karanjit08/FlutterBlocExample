import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/cart_data_list.dart';
import 'package:meta/meta.dart';

import '../../model/product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveItemEvent>(cartRemoveItemEvent);
  }



  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) async{
    emit(CartLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(CartLoadingSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveItemEvent(CartRemoveItemEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    // emit(CartItemRemoveState(cartItems: cartItems));
    emit(CartLoadingSuccessState(cartItems: cartItems));
  }
}
