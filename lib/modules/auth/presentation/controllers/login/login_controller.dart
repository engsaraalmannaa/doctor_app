
import 'dart:developer';

import 'package:doctor_program/core/storage/shared_preferences.dart';
import 'package:doctor_program/modules/auth/data/data_source/auth_data_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isloading=false;
  Map<String, dynamic>? userData; 
  Future <bool?> loginfunction()async {
    isloading=true;
    update();
    print("i am in login funcation");
    print("email :${emailController.text}");
    print("password :${passwordController.text}");
    final result = await AuthDataSource.login(
        emailController.text,
        passwordController.text
    );
    
    isloading=false;
    update();
    if (result != null) {
      userData = result; 


       await CacheHelper.set(key: "email", value: userData!['email']);
        await CacheHelper.set(key: "first_name", value: userData!['first_name']);
        await CacheHelper.set(key: "last_name", value: userData!['last_name']);
        await CacheHelper.set(key: "father_name", value: userData!['father_name']);

      return true;
    }
    return false;
  }

}
