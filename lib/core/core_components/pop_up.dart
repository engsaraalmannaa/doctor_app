//not read yet
import 'package:doctor_program/core/core_components/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/const_colors.dart';
import '../storage/shared_preferences.dart';

void showLoader() => showDialog(
    context: Get.context!,
    builder: (_) => Center(
          child: CircularProgressIndicator(),
        ));

void showSnackBar(String text) => ScaffoldMessenger.of(Get.context!)
    .showSnackBar(SnackBar(content: Text(text)));

void showDeleteConfirmationDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
  required String address,
  required String colorword,
  required String word,
}
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(address),
        content: Text("هل أنت متأكد أنك تريد حذف هذا العنصر؟",
            style: TextStyle(color:Colors.black)),
        actions: [
          TextButton(
            child: Text(word),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
          TextButton(
            child: Container(
              height: 10.vmin,
              width: 20.vmin,
              decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.all(
                     Radius.circular(2.vmin),
                  )),
              child: Center(
                child: Text(colorword,
                style: TextStyle(color: const Color.fromARGB(255, 110, 32, 32))),
              ),
            ),
            onPressed: () async {
              
              onConfirm();
             
            },
          ),
        ],
      );
    },
  );
}
