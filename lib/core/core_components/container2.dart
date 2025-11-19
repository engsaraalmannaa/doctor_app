import 'package:doctor_program/core/const/const_colors.dart';
import 'package:doctor_program/modules/pationts/data/model/appointment_model.dart';
import 'package:doctor_program/modules/pationts/presentation/controllers/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Container2 extends StatelessWidget {
  const Container2({super.key, required this.model, required this.index});

  final AppointmentModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (model.patient == null) return SizedBox(); 
    return Padding(
      padding: EdgeInsets.only(
          right: 1.vmin, left: 5.vmin, top: 1.vmin, bottom: 1.vmin),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: ConstColors.darkBlue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5.vmin)),
          borderOnForeground: true,
          color: Colors.white54,
          child: Padding(
            padding: EdgeInsets.all(2.vmin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    "الموعد ${index + 1}" ?? '',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: ConstColors.darkBlue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "الاسم:${model.patient?.firstName} ${model.patient?.fatherName} ${model.patient?.lastName}\n"
                    "${model.patient?.phone != null ? "الهاتف:${model.patient!.phone}\n" : ""}"
                    "${model.patient?.birthDate != null ? "تاريخ الميلاد:${model.patient!.birthDate.toString().split(' ')[0]}\n" : ""}"
                    "${model.patient?.address != null ? "العنوان:${model.patient!.address}" : ""}",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  leading: Icon(
                    Icons.access_time,
                    color: ConstColors.darkBlue,
                    size: 14.vmin,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
