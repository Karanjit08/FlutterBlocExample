import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/features/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_example/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/features/home/ui/product_list_tile_widget.dart';
import 'package:flutter_bloc_example/features/model/product_data_model.dart';

import '../../wishlist/ui/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  final HomeBloc homeBloc = HomeBloc();
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous,current)=> current is HomeActionState,
      buildWhen: (previous,current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeProductWishlistNavigateActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WishlistScreen()));
        }
        else if(state is HomeProductCartNavigateActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));

        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.teal,),),);
          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Grocery Products'),
                actions: [
                  IconButton(onPressed: () {
                    homeBloc.add(HomeProductWishlistNavigateEvent());
                  }, icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartNavigateEvent());
                      }, icon: Icon(Icons.shopping_cart_outlined))
                ],
              ),
              body: ListView.builder(
                itemCount: successState.product.length,
                  itemBuilder: (context,index){
                    return ProductTileWidget(
                        productDataModel: successState.product[index], homeBloc: homeBloc);
                  }),
            );
          default: return Container();
        }
      },
    );
  }
}
