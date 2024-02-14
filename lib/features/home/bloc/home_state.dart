part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState{}
class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState{
}


class HomeLoadingSuccessState extends HomeState{
  List<ProductDataModel>product;
  HomeLoadingSuccessState({required this.product});
}


class HomeLoadingErrorState extends HomeState{}

class HomeProductWishlistNavigateActionState extends HomeActionState{}

class HomeProductCartNavigateActionState extends HomeActionState{}


