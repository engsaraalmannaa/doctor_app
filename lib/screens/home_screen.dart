import 'package:doctor_program/core/const/const_colors.dart';
import 'package:doctor_program/core/core_components/container1.dart';
import 'package:doctor_program/core/core_components/custom_drawer.dart';
import 'package:doctor_program/core/core_components/wallpaper.dart';
import 'package:doctor_program/core/storage/shared_preferences.dart';
import 'package:doctor_program/screens/appointments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../modules/pationts/presentation/controllers/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static const name = "/first";
  static final page = GetPage(
    name: name,
    page: () => HomeScreen(),
    binding: BindingsBuilder(() {
      Get.put(HomeController());
    }),
  );

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Stack(children: [
       Wallpaper(num: 0.1,
          image: "assets/images/pattern.jpg"),
      
      Scaffold(

          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          endDrawer: CustomDrawer(),
          
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 10.h),
            child: AppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(
                icon: Icon(
                  Icons.calendar_month,
                  size: 9.vmin,
                  color: Colors.white,
                ),
                onPressed: () => Get.toNamed(AppointmentsScreen.name),
              ),
              title: Text(
                "أهلاً بك",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 10.vmin,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                          scaffoldKey.currentState?.openEndDrawer(),
            )],
              
              backgroundColor: ConstColors.darkBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.vmin),
                bottomRight: Radius.circular(10.vmin),
              )),
            ),
          ),
          body: GetBuilder<HomeController>(
              
              builder: (controller) {
            if (controller.isloading) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.data == null || controller.data!.isEmpty) {
              return Center(
                child: Text(
                  "لا يوجد استشارات لعرضها",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async => controller.Consultations(),
              child: ListView.builder(
                  itemCount: controller.data!.length,
                  itemBuilder: (context, i) {
                    final currentModel = controller.data![i];
                    final isReplied = CacheHelper.get<String>(
                          'consultation_reply_${currentModel.id}',
                        ) !=
                        null;

                    return Container1(
                      model: controller.data![i],
                      index: i,
                      isReplied: isReplied,
                    );
                  }),
            );
          }))
    ]);
  }
}
