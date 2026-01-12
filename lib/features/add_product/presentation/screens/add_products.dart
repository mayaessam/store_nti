import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/widgets/custom_text_form_field_with_title.dart';
import '../widgets/nav_bar.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  void clear(){
    titleController.clear();
    descriptionController.clear();
    imageController.clear();
    stockController.clear();
    priceController.clear();
  }
  final Dio dio=Dio();
  bool isLoading=false;


  Future<void>addProducts()async{

try{
  setState(() {
    isLoading=true;
  });
  final Response response=await dio.post(
    'https://dummyjson.com/products/add',data: {
  'title':titleController.text,
  'description':descriptionController.text,
  'stock':stockController.text,
  'price':priceController.text,
  "thumbnail":descriptionController.text
});
  log('response$response');

setState(() {
  isLoading=false;
});
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('product added ')));
log('product added ${response.data}');
clear();
}on DioException catch(e){
  log("error:$e");
  setState(() {
    isLoading=false;
  });
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('error occured ')));
}

  }
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              CustomTextFormFieldWithTitle(fieldLabel: 'Title',
                controller: titleController,
                hint: 'Title',),
              CustomTextFormFieldWithTitle(fieldLabel: 'Description',
                controller: descriptionController,
                hint: 'Description',),
              CustomTextFormFieldWithTitle(fieldLabel: 'Image',
                controller: imageController,
                hint: 'Image',),
              CustomTextFormFieldWithTitle(fieldLabel: 'Stock',
                controller: stockController,
                hint: 'Stock',),
              CustomTextFormFieldWithTitle(fieldLabel: 'Price',
                controller: priceController,
                hint: 'Price',),
              Spacer(),
              ElevatedButton(

                  onPressed: (){
                  addProducts();
                  },
                  child: Text('Add product'))
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MainBottomNav(currentIndex: 1),

    );
  }
}
