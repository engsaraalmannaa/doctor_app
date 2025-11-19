import 'package:doctor_program/core/const/const_colors.dart';
import 'package:doctor_program/core/core_components/container1.dart';
import 'package:doctor_program/core/core_components/container2.dart';
import 'package:doctor_program/core/core_components/simple_container1.dart';
import 'package:doctor_program/core/core_components/wallpaper.dart';
import 'package:doctor_program/core/storage/shared_preferences.dart';
import 'package:doctor_program/modules/pationts/presentation/controllers/appointment_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/core_components/custom_drawer.dart';
String? doctorStatus = CacheHelper.get<String>('doctor_status');

class AppointmentsScreen extends GetView<AppointmentController> {
  const AppointmentsScreen({super.key});

  static const name = "/appointments";
  static final page = GetPage(
      name: name,
      page: () =>  AppointmentsScreen(),
    binding: BindingsBuilder(() {Get.put(AppointmentController());
    }),

  );
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Stack(
      children: [
        Wallpaper(num: 0.1,
          image: "assets/images/pattern.jpg"),
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar:
          PreferredSize(
            preferredSize: Size(double.infinity, 10.h),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Text("المواعيد",
                style: TextStyle(color: Colors.white),),
              centerTitle: true,
              backgroundColor: ConstColors.darkBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.vmin),
                    bottomRight: Radius.circular(10.vmin),
                  )),
            ),
          ),
          body:
   
    GetBuilder<AppointmentController>(
    
     builder: (controller)=>
    controller.isloadingappointment ? Center(
    child : CircularProgressIndicator()):
    RefreshIndicator(
    onRefresh: () async => controller.Appointments(),
      child:
      controller.data == null || controller.data!.isEmpty 
          ? Center(child: Text("لا يوجد مواعيد حالياً"))
          : ListView.builder(
          itemCount: controller.data!.length,
          itemBuilder: (context,i)=>
    Container2(
      model: controller.data![i],
     index: i))

    )
          ),
        )
      ],
    );
  }
}
