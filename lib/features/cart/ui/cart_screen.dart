import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_example/features/cart/ui/cart_list_tile_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartInitialEvent());
  }
  final CartBloc cartBloc = CartBloc();

  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      buildWhen: (current,previous)=> current is !CartActionState,
      listener: (context, state) {
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case CartLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.teal,),),);
          case CartLoadingSuccessState:
            final cartSuccessState  = state as CartLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Added Products'),
              ),
              body: ListView.builder(
                itemCount: cartSuccessState.cartItems.length,
                  itemBuilder: (context,index){
                  return CartTileWidget(
                      productDataModel: cartSuccessState.cartItems[index],
                      cartBloc: cartBloc);
                  }),
            );
          default:
            return Container();
        }
      },
    );
  }
}
