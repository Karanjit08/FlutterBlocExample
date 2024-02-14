import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_example/features/model/product_data_model.dart';
import 'package:flutter_bloc_example/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_example/features/wishlist/ui/wishlist_list_tile_widget.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    wishlistBloc.add(WishListInitialEvent());
  }
  final WishlistBloc wishlistBloc = WishlistBloc();
  late final ProductDataModel productDataModel;
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      buildWhen: (current, previous)=> current is !WishlistActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case WishlistLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.teal,),),);
          case WishlistSuccessState:
            final wishListSuccessState = state as WishlistSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Wishlisted Products'),
              ),
              body: ListView.builder(
                itemCount: wishListSuccessState.wishListItems.length,
                  itemBuilder: (context,index){
                  return CartTileWidget(productDataModel: wishListSuccessState.wishListItems[index], wishlistBloc: wishlistBloc);
                  }),
            );
          default:
            return Container();
        }
      },
    );
  }
}
