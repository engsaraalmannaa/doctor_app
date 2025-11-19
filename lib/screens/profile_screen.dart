// import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:doctor_program/core/const/const_colors.dart';
import 'package:doctor_program/core/core_components/app_text_form_field.dart';
import 'package:doctor_program/core/core_components/wallpaper.dart';
import 'package:doctor_program/core/storage/shared_preferences.dart';
import 'package:doctor_program/modules/pationts/presentation/controllers/home/home_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileDoctorScreen extends StatefulWidget {
  ProfileDoctorScreen({super.key});
  static const name = "/profiledoctor";
  static final page = GetPage(
    name: name,
    page: () => ProfileDoctorScreen(),
  );

  @override
  State<ProfileDoctorScreen> createState() => _ProfileDoctorScreenState();
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.profile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wallpaper(num: 0.1, image: "assets/images/pattern.jpg"),
        GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.isloadingprofile
                ? const Center(child: CircularProgressIndicator())
                : Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 9.vmin,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      backgroundColor: ConstColors.darkBlue,
                      title: Text(
                        "الملف الشخصي",
                        style: TextStyle(
                            fontSize: 14.spa,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      centerTitle: true,
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.vmin, bottom: 1.vmin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.h),
                            AppTextFormField(
                              hint: "الاسم الأول",
                              controller: controller.first_name,
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                            AppTextFormField(
                              hint: "اسم الأب",
                              controller: controller.father_name,
                              readOnly: true,
                              color: Colors.amber,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                              minlines: 1,
                            ),
                            AppTextFormField(
                              hint: "الاسم الأخير",
                              controller: controller.last_name,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                            ),
                            AppTextFormField(
                              hint: "البريد الإلكتروني",
                              controller: controller.email,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                            ),
                            AppTextFormField(
                              hint: "الهاتف",
                              controller: controller.phone,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                            ),
                            AppTextFormField(
                              hint: "الجنس",
                              controller: TextEditingController(
                                text: controller.gender.text.toLowerCase() ==
                                        "female"
                                    ? "أنثى"
                                    : controller.gender.text.toLowerCase() ==
                                            "male"
                                        ? "ذكر"
                                        : controller.gender.text,
                              ),
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                            AppTextFormField(
                              hint: "تاريخ الميلاد",
                              controller: controller.birth_date,
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                            AppTextFormField(
                              hint: "الرقم الوطني",
                              controller: controller.national_number,
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                            AppTextFormField(
                              hint: "العنوان",
                              controller: controller.address,
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                            AppTextFormField(
                              hint: "رقم الترخيص",
                              controller: controller.license_number,
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                            AppTextFormField(
                              hint: "سنوات الخبرة",
                              controller: controller.experienceYears,
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                            AppTextFormField(
                              hint: "تكلفة الموعد",
                              controller: controller.meet_cost,
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                            AppTextFormField(
                              hint: "السيرة الذاتية",
                              controller: controller.bio,
                              color: Colors.amber,
                              readOnly: true,
                              minlines: 1,
                              fillColor:
                                  Colors.blueGrey.shade50.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
