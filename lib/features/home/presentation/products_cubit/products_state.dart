import '../../../../models/product_model.dart';

abstract class ProductsState{}

class ProductsInitial extends ProductsState{}
class ProductsLoading extends ProductsState{}
class ProductsFailure extends ProductsState{}
class ProductsSuccess extends ProductsState{
 List<Product>products=[];
  ProductsSuccess({required this.products});
}