part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistActionState extends WishlistState{}

class WishlistLoadingState extends WishlistState{}


class WishlistSuccessState extends WishlistState{
  List<ProductDataModel>wishListItems ;
  WishlistSuccessState({required this.wishListItems });
}


class WishlistErrorState extends WishlistState{}



