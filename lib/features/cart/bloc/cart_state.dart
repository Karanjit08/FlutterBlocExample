part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{}


class CartInitial extends CartState {}


class CartLoadingState extends CartState{}

class CartLoadingSuccessState extends CartState{
  List<ProductDataModel>cartItems;
  CartLoadingSuccessState({required this.cartItems});
}


