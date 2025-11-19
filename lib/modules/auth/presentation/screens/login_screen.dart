import 'package:doctor_program/core/const/const_colors.dart';
import 'package:doctor_program/core/core_components/app_text_form_field.dart';
import 'package:doctor_program/core/core_components/button.dart';
import 'package:doctor_program/core/core_components/state_component.dart';
import 'package:doctor_program/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/login/login_binding.dart';
import '../controllers/login/login_controller.dart';
import '../controllers/login/login_middleware.dart';

class LoginScreen extends GetView<LoginController> {
   LoginScreen({super.key});
  static const name = "/";
  static final page = GetPage(
    name: name,
    page: () =>  LoginScreen(),
      binding: LoginBinding(),
      middlewares: [
        LoginMiddleware(),
      ]
  );
final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
            physics:  BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black12, Colors.transparent],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Opacity(
                          opacity: 0.65,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/doctor.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 295,
                          ),
                          const Text(
                            "اهلا بك طبيبنا",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.indigo),
                          ),
                          const Text(
                            " قم بتسجيل الدخول",
                            style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          AppTextFormField(
                            minlines: 1,
                            color: Colors.indigo,
                            keyboardType: TextInputType.emailAddress,
                            hint: "البريد الالكتروني",
                            textDirection: TextDirection.rtl,
                            icon: const Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            controller: controller.emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "البريد الالكتروني مطلوب!";
                              }
                               if (!value.isEmail)
                              {
                                return " البريد الإلكتروني غير صالح!";
                              }
                               return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextFormField1(
                            color: Colors.indigo,
                            hint: "كلمة المرور",
                            textDirection: TextDirection.rtl,
isPass: true,
                            controller: controller.passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "كلمة المرور مطلوبة";
                              }
                               if (value.length < 6)
                              {
                                return "كلمة المرور يجب أن تكون على الأقل 6 أحرف!";
                              }
                               return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GetBuilder<LoginController>(
                            builder: (controller) {
                              return
                           
                                controller.isloading?CircularProgressIndicator() :Button(
                                  text: "تسجيل الدخول",
                                  textDirection:
                                  TextDirection.rtl,
                                  ontap: () async {
                                    print("after valid");
                                    if (formKey.currentState!.validate()) {
                                      print("test");
                                      await controller.loginfunction();
                                    }
                                  }
                                );}
                            )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          )
    );
  }
}
