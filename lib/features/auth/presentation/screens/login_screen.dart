
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_nti/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../validators.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Dio dio=Dio();
  Future<void>login()async{
    try{
      Response response=await dio.post(
          'https://accessories-eshop.runasp.net/api/auth/login',
          data: {
            'email':emailController.text,
            'password':passwordController.text
          }
      );
    }catch(e){
      log("error:$e");
    }
  }

  bool isChecked = false;
  bool _isHidden = true;
  GlobalKey<FormState>key=GlobalKey();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Hi, Wecome Back! 👋',size: 30,weight: FontWeight.bold),
                CustomText(text: 'Hello again, you’ve been missed!',color: Colors.grey.shade700,),
                Gap(50),CustomText(text: 'Email',color: Color(0xFF4E0189),size: 16,),
                CustomTextFormField( fieldLabel: 'Email', hint: 'enter your email',
                  controller: emailController,validator: (value){
                    return Validator.validateEmail(value!);
                  },),
                Gap(10),


                Gap(20),
                CustomText(text: 'Password',color: Color(0xFF4E0189),size: 16,),
                Gap(10),
                CustomTextFormField(
                  obscureText: _isHidden,
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      _isHidden=!_isHidden;
                    });
                  }, icon: Icon(Icons.visibility)),
                  fieldLabel: 'password',
                  hint: 'enter password',
                  controller: passwordController,
                  validator: (value){
                    return Validator.validatePassword(value!);
                  },),
                Gap(10),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    CustomText(text: 'Remember Me',size: 14,),
                    Spacer(),
                    CustomText(text: 'Forggot Password',size: 14,color: Colors.red,),



                  ],
                ),
                GestureDetector(

                  onTap: ()async{
                    if(key.currentState!.validate()){
                      log('${emailController.text}');
                      log('${passwordController.text}');
                      await login();
                    }

                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                        Color(0xFF4E0189)
                    ),
                    child: Center(child: CustomText(text: 'Login',size: 20,color: Colors.white,)),
                  ),
                ),
                Gap(20),
                Row(
                  children: [
                    Container(
                      width: 180,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Gap(10)
                          ,Text(
                            "Git Hub",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 180,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Gap(10)
                          ,Text(
                            "Git Lab",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(240),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Donot have accout?'),
                    Gap(10),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                        },
                        child: CustomText(text: 'Sign up',color:  Color(0xFF4E0189) ,)),
                  ],
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
