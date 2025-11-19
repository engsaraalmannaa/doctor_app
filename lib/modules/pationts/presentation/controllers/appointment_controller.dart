import 'package:doctor_program/modules/pationts/data/data_source/appointment_data_source.dart';
import 'package:doctor_program/modules/pationts/data/model/appointment_model.dart';
import 'package:doctor_program/screens/appointments.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  List<AppointmentModel>? data = [];
   @override
  void onInit() {
    super.onInit();
    Appointments();
  }
  bool isloadingappointment = false;
  

  Future<void> Appointments() async {
    isloadingappointment = true;
    update();
    try {
     final allAppointments = await AppointmentDataSource.getAllAppointments();
      data = allAppointments.where((appointment) =>
              appointment.meetStatus == "accepted" ||
              appointment.meetStatus == "done")
          .toList();
    } catch (e) {
      print("Error loading appointments: $e");
      data = await AppointmentDataSource.getAllAppointments();
    }
    isloadingappointment = false;
    update();
  }
}
