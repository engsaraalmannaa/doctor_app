import 'package:doctor_program/core/const/const_colors.dart';
import 'package:doctor_program/core/core_components/app_text_form_field.dart';
import 'package:doctor_program/core/core_components/button.dart';
import 'package:doctor_program/core/core_components/custom_drawer.dart';
import 'package:doctor_program/core/core_components/pop_up.dart';
import 'package:doctor_program/core/core_components/wallpaper.dart';
import 'package:doctor_program/core/storage/shared_preferences.dart';
import 'package:doctor_program/modules/pationts/data/data_source/cosultation_data_sourse.dart';
import 'package:doctor_program/modules/pationts/data/model/consultations_model.dart';
import 'package:doctor_program/modules/pationts/presentation/controllers/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Consultation extends StatefulWidget {
  final ConsultationModel model;
  const Consultation({
    super.key,
    required this.model,
  });
  static const name = "/k";
  static final page = GetPage(
    name: name,
    page: () => Consultation(
      model: null!,
    ),
  );

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  String? replyText;
  final GlobalKey<FormState> key = GlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    String? savedReply =
        CacheHelper.get<String>('consultation_reply_${widget.model.id}');
    if (savedReply != null) {
      replyText = savedReply;
    }
  }
    Widget build(BuildContext context) {
      return Stack(
        children: [
          
          Wallpaper(num: 0.1,
          image: "assets/images/pattern.jpg"),
          Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            endDrawer: CustomDrawer(),
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 10.h),
              child: AppBar(
                centerTitle: true,
                title:Text("الرد على الإستشارة",style: TextStyle(fontSize: 13.spa, fontWeight: FontWeight.w600,color: Colors.white)),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.menu, size: 10.vmin, color: Colors.white),
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ],
                backgroundColor: ConstColors.darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.vmin),
                    bottomRight: Radius.circular(10.vmin),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7.vmin),
                      child: Text(
                        widget.model.question,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Divider(
                      color: ConstColors.darkBlue,
                      endIndent: 5.vmin,
                      indent: 5.vmin,
                    ),
                    if (replyText == null)
                      GetBuilder<HomeController>(
                        builder: (controller) => Column(
                          children: [
                            AppTextFormField(
                              minlines: 3,
                              textDirection: TextDirection.rtl,
                              hint: "اكتب ردك",
                              color: Colors.black,
                              controller: controller.answer,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 2.h),
                            controller.isloadingConsltation
                                ? CircularProgressIndicator()
                                : Button(
                                    text: "موافق",
                                    ontap: () async {
                                      if (key.currentState!.validate()) {
                                        controller.ConsultationsAnswer();
                                        await CacheHelper.set(
                                          key:
                                              'consultation_reply_${widget.model.id}',
                                          value: controller.answer.text,
                                        );
                                        setState(() {
                                          replyText = controller.answer.text;
                                          controller.answer.clear();
                                        });
                                      }
                                    },
                                  ),
                          ],
                        ),
                      ),
                    if (replyText != null)
                      Padding(
                        padding:  EdgeInsets.symmetric(
                        horizontal: 2.vmin,
      vertical: 1.vmin,
                          ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
        minHeight: 10.vmin, 
        minWidth: 100.vmin
      ),
                          child: Card(
                           elevation: 4,
                          shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: ConstColors.Blue,
                                        )
                                        ,borderRadius: BorderRadius.circular(5.vmin)
                                    ),
                                    borderOnForeground:true,
                                    color: Colors.white70,
                            child: Padding(
                              padding:  EdgeInsets.all(4.vmin),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$replyText",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

