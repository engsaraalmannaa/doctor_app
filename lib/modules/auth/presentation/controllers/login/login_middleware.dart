import 'package:doctor_program/core/const/app_key.dart';
import 'package:doctor_program/core/storage/shared_preferences.dart';
import 'package:doctor_program/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginMiddleware extends GetMiddleware {


  @override
  RouteSettings? redirect(String? route) {
    final token=CacheHelper.get(AppKey.token);

    if(token !=null){
      return const RouteSettings(
        name: HomeScreen.name
      );
    }
    return null;
  }



}