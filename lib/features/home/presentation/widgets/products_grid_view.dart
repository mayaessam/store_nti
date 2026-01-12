
import 'package:flutter/material.dart';

import '../../../../models/product_model.dart';
import 'custom_product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: .6,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return CustomProductItem(product: products[index]);
      },
    );
  }
}
