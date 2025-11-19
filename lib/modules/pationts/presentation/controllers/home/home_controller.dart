import 'package:doctor_program/core/core_components/app_toast.dart';
import 'package:doctor_program/core/core_components/pop_up.dart';
import 'package:doctor_program/modules/pationts/data/data_source/cosultation_data_sourse.dart';
import 'package:doctor_program/modules/pationts/data/model/consultations_model.dart';
import 'package:doctor_program/modules/pationts/data/model/doctor_model.dart';
import 'package:doctor_program/modules/pationts/data/model/show_answer_consultation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  List<ConsultationModel>? data = [];
  Data1? data2;
  ShowAnswerConsultationModel? showAnswerConsultationModel;
  @override
  void onInit() {
    super.onInit();
    Future.microtask(() => Consultations());
  }

  final TextEditingController answer = TextEditingController();
  String? idConsltation;
  int? idConsltation1;
  bool isloading = false;
  String replyText = "";

  Future<void> Consultations() async {
    isloading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
    data = await ConsultationDataSource.getAllConsultations();
    isloading = false;
    update();
  }

  bool isloadingConsltation = false;
  Future<void> ConsultationsAnswer() async {
    isloadingConsltation = true;
    update();
    try {
      await ConsultationDataSource.answerConsultations(
          answer: answer.text, id: idConsltation!);
      replyText = answer.text;
      answer.clear();
      await Consultations();
      showSnackBar("تم إرسال الرد بنجاح");
    } catch (e) {
      showSnackBar("فشل في إرسال الرد");
    }
    isloadingConsltation = false;
    update();
  }





  final TextEditingController first_name = TextEditingController();
  final TextEditingController father_name = TextEditingController();
  final TextEditingController last_name = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController birth_date = TextEditingController();
  final TextEditingController national_number = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController experienceYears = TextEditingController();
  final TextEditingController license_number = TextEditingController();
  final TextEditingController meet_cost = TextEditingController();
  final TextEditingController image = TextEditingController();
  final TextEditingController bio = TextEditingController();
  bool isloadingprofile = false;
  DoctorModel? data1;
  Future<void> profile() async {
    isloadingprofile = true;
    update();

    try {
      data1 = await ConsultationDataSource.showprofile();

      first_name.text = data1?.data?.firstName ?? "";
      father_name.text = data1?.data?.fatherName ?? "";
      last_name.text = data1?.data?.lastName ?? "";
      email.text = data1?.data?.email ?? "";
      phone.text = data1?.data?.phone ?? "";
      gender.text = data1?.data?.gender ?? "";
      birth_date.text = data1?.data?.birthDate ?? "";
      national_number.text = data1?.data?.nationalNumber ?? "";
      address.text = data1?.data?.address ?? "";
      experienceYears.text = data1?.data?.experienceYears ?? "";
      license_number.text = data1?.data?.licenseNumber ?? "";
      meet_cost.text = data1?.data?.meetCost ?? "";
      bio.text = data1?.data?.bio ?? "";
      image.text = data1?.data?.imageUrl ?? "";
    } catch (e) {
      print("خطأ أثناء جلب البيانات: $e");
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showSnackBar("حدث خطأ أثناء تحميل المعلومات");
      });
    }
    isloadingprofile = false;
    update();
  }

 
}
