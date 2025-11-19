import 'package:doctor_program/core/core_components/custom_drawer.dart';
import 'package:doctor_program/screens/appointments.dart';
import 'package:doctor_program/screens/consultation.dart';
import 'package:doctor_program/screens/home_screen.dart';
import 'package:doctor_program/modules/auth/presentation/screens/login_screen.dart';
import 'package:doctor_program/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/storage/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (_, __, ___)
      =>GetMaterialApp(

        locale:  Locale('ar'),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
            debugShowCheckedModeBanner: false,
            getPages: [
        LoginScreen.page,
        HomeScreen.page,
        Consultation.page,
              CustomDrawer.page,
              AppointmentsScreen.page,
              ProfileDoctorScreen.page
      ]));
    }
  }

