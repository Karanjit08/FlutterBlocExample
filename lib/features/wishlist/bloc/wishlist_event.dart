part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}




class WishListInitialEvent extends WishlistEvent{}

class WishlistItemRemoveEvent extends WishlistEvent{
  final ProductDataModel productDataModel;
  WishlistItemRemoveEvent({required this.productDataModel});
}


