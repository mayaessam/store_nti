import 'dart:developer';

import 'package:e_commerce_nti/features/home/presentation/products_cubit/products_state.dart';
import 'package:e_commerce_nti/features/products/data/data_source/remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState>{
  RemoteDataSource remoteDataSource=RemoteDataSource();
  ProductsCubit():super(ProductsInitial());
  Future<void >getAllProducts()async{
    emit(ProductsLoading());
    await remoteDataSource.getAllProducts().then(
        (value){
          emit(ProductsSuccess(products: value));
          log('value in cubit$value');
        },
        onError: (error){
          emit(ProductsFailure());
          log("error in cubit$error");
    }
    );
  }

}
