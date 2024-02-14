import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_example/features/model/product_data_model.dart';


class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  ProductTileWidget({required this.productDataModel,required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(productDataModel.imageUrl,fit: BoxFit.fitWidth,),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(productDataModel.name,style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(productDataModel.desc,style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w700),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Rs. ' + productDataModel.price.toString(),style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w700),),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      homeBloc.add(HomeProductWishlistButtonClickEvent(productDataModel: productDataModel));
                    }, icon: Icon(Icons.favorite_border)),
                    IconButton(onPressed: (){
                      homeBloc.add(HomeProductCartButtonClickEvent(
                        productDataModel: productDataModel
                      ));
                    }, icon: Icon(Icons.shopping_cart_outlined))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
