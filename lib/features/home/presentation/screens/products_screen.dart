// screens/products_screen.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_nti/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:e_commerce_nti/features/home/presentation/products_cubit/products_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/product_model.dart';
import '../../../add_product/presentation/screens/add_products.dart';
import '../../../add_product/presentation/widgets/nav_bar.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../widgets/products_grid_view.dart';
import '../../../products/presentation/screens/filter_products_by_category.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  List<dynamic> categories = [];
  final dio = Dio();

  @override
  void initState() {

    getAllCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Categories
            SizedBox(
              height: 60,
              child:
              ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterProductsByCategory(
                              categoryName: categories[index]['name'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            categories[index]['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Products
            Expanded(
              child: 
             BlocBuilder<ProductsCubit,ProductsState>(builder: (context,state){
               if(state is ProductsLoading){
                 return Center(child: CircularProgressIndicator());
               }else if (state is ProductsFailure){
                 return Center(child: Text('error'));

               }
               else if(state is ProductsSuccess){
                 return ProductsGridView(products: state.products);
               }
                  return SizedBox();
             }
             )
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MainBottomNav(currentIndex: 0),


    );
  }

  Future<void> getAllCategories() async {
    Response response = await dio.get(
      'https://dummyjson.com/products/categories',
    );

    categories = response.data;
    setState(() {});

  }
}
//* 1- Model
//* 2- custom widget with variables
//* 3- call custom widget in gridview.builder / listview.builder