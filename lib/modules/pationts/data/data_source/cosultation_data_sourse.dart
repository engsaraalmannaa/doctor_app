import 'dart:convert';
import 'dart:developer';
import 'package:doctor_program/core/network/api_helper/api_helper/api_enum.dart';
import 'package:doctor_program/core/network/api_helper/api_helper/api_helper.dart';
import 'package:doctor_program/modules/pationts/data/model/consultations_model.dart';
import 'package:doctor_program/modules/pationts/data/model/doctor_model.dart';
import 'package:doctor_program/modules/pationts/data/model/show_answer_consultation_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/const/api_const.dart';

class ConsultationDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<List<ConsultationModel>> getAllConsultations() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.consultations,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
        
     if (response == null || response['data'] == null) {
    return [];
  }

  List<dynamic> data = response['data'] as List<dynamic>;
    List<ConsultationModel> consultations =
        data.map((e) => ConsultationModel.fromJson(e)).toList();
   return consultations;
  }

  static Future<void> answerConsultations(
      {required String id, required String answer}) async {
    var response = await apiHelper.sendRequest(
      
        endPoint: ApiConst.consultationsAnswer(id: id),
        method: RequestType.post,
        requiresAuth: true,
        body: {"answer": answer},
        context: Get.context!);
  }


  
    static Future<DoctorModel> showprofile() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.doctorprofile,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);

    if (response == null || response['data'] == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }

    return DoctorModel.fromJson(response);
  }

}
