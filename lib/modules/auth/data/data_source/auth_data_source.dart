import 'package:doctor_program/core/const/app_key.dart';
import 'package:doctor_program/core/network/api_helper/api_helper/api_enum.dart';
import 'package:doctor_program/core/network/api_helper/api_helper/api_helper.dart';
import 'package:doctor_program/core/storage/shared_preferences.dart';
import 'package:doctor_program/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/const/api_const.dart';

class AuthDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<Map<String, dynamic>?> login(String email,String password)async{
print(email??"000");
print(password??"000");
    var response =
    await apiHelper.sendRequest(
      endPoint: ApiConst.login,
      method:RequestType.post,
        context: Get.context!,
        body: {
          "email" : email,
          "password" : password,
        },


    );
print("test respo${response}");
    if(response !=null){
await CacheHelper.set(key:AppKey.token, value: response["token"]);
      Get.offAllNamed(HomeScreen.name);
      return Map<String, dynamic>.from(response);
    }
  }
}