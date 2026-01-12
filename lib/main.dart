import 'package:e_commerce_nti/features/add_product/presentation/screens/add_products.dart';
import 'package:e_commerce_nti/features/products/presentation/screens/filter_products_by_category.dart';
import 'package:e_commerce_nti/features/home/presentation/screens/products_screen.dart';
import 'package:e_commerce_nti/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/screens/login_screen.dart';
import 'features/home/presentation/products_cubit/products_cubit.dart';
import 'features/profile/presentation/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/add_products': (context) => AddProducts(),
        '/profile_screen': (context) => Profile(),
        '/sign_up': (context) => SignUpScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/products_screen': (context) => BlocProvider(
          create: (_) => ProductsCubit()..getAllProducts(),
          child: const ProductsScreen(),
        ),

        '/filter_products_by_category': (context) =>
            FilterProductsByCategory(categoryName: ''),
      },
      initialRoute: '/products_screen',
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
    );
  }
}
