part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}




class HomeInitialEvent extends HomeEvent{}


class HomeProductWishlistButtonClickEvent extends HomeEvent{
  final ProductDataModel productDataModel;
  HomeProductWishlistButtonClickEvent({required this.productDataModel});
}

class HomeProductCartButtonClickEvent extends HomeEvent{
  final ProductDataModel productDataModel;
  HomeProductCartButtonClickEvent({required this.productDataModel});
}


class HomeProductWishlistNavigateEvent extends HomeEvent{}

class HomeProductCartNavigateEvent extends HomeEvent{}
