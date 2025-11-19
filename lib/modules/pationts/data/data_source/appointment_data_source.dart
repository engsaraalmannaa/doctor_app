import 'package:doctor_program/core/const/api_const.dart';
import 'package:doctor_program/core/network/api_helper/api_helper/api_enum.dart';
import 'package:doctor_program/core/network/api_helper/api_helper/api_helper.dart';
import 'package:doctor_program/modules/pationts/data/model/appointment_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppointmentDataSource {
  static ApiHelper apiHelper = ApiHelper();

 static Future<List<AppointmentModel>> getAllAppointments() async {
    var response = await apiHelper.sendRequest(
        endPoint:ApiConst.appointments ,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!
    );
    List<dynamic> data = response['data'];
    if (data == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }
    List<AppointmentModel> appointments = data.map((e) => AppointmentModel.fromJson(e)).toList();
    return appointments ;
  }


  
  static Future<void> postdoctorstatus(String meet_status,int patient_id,int specialty_id ,int doctor_id ,String work_day,String work_time ) async {
    var response = await apiHelper.sendRequest(
        endPoint:ApiConst.doctorstatus ,
        method: RequestType.post,
        requiresAuth: true,
        context: Get.context!,
        body: {
          "meet_status": meet_status,
          "patient_id" : patient_id,
          "specialty_id " : specialty_id,
          "doctor_id" : doctor_id,
          "work_day" : work_day,
          "work_time" : work_time,
        },
    );
   
    
  }
}
