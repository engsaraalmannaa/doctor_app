import 'package:doctor_program/core/const/const_colors.dart';
import 'package:doctor_program/core/storage/shared_preferences.dart';
import 'package:doctor_program/modules/auth/presentation/screens/login_screen.dart';
import 'package:doctor_program/screens/home_screen.dart';
import 'package:doctor_program/screens/profile_screen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

import 'costom_widgets.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});
  static const name = "/drawe11r";
  static final page = GetPage(
    name: name,
    page: () => CustomDrawer(),
  );

  @override
  State<CustomDrawer> createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    String? email = CacheHelper.get("email");
    String? first_name = CacheHelper.get("first_name");
    String? last_name = CacheHelper.get("last_name");
    String? father_name = CacheHelper.get("father_name");

    String fullName =
        "${first_name ?? ''} ${father_name ?? ''} ${last_name ?? ''}";
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Drawer(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      width: 90.w,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ConstColors.darkBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.vmin,
                ),
                Text(
                  fullName.trim().isEmpty ? 'الاسم غير متوفر' : fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email ?? 'البريد غير متوفر',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'الملف الشخصي',
              style: TextStyle(color: ConstColors.darkBlue),
            ),
            onTap: () {
              Get.toNamed(ProfileDoctorScreen.name);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: ConstColors.darkBlue,
            ),
            title: Text('تسجيل الخروج',
                style: TextStyle(color: ConstColors.darkBlue)),
            onTap: () async {
              await CacheHelper.clear();
              Get.offAllNamed(LoginScreen.name);
            },
          ),
        ],
      ),
    );
  }
}
