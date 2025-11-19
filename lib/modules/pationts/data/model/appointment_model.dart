
class AppointmentModel {
  final int? id;
  final int? specialtyId;
  final int? doctorId;
  final int? patientId;
  final String? workDay;
  final String? workTime;
  final int? meetCost;
  final String? meetStatus;
  final PatientModel? patient;

  AppointmentModel({
    this.id,
    this.specialtyId,
    this.doctorId,
    this.patientId,
    this.workDay,
    this.workTime,
    this.meetCost,
    this.meetStatus,
    this.patient,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      specialtyId: json['specialty_id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      workDay: json['work_day'],
      workTime: json['work_time'],
      meetCost: json['meet_cost'],
      meetStatus: json['meet_status'],
      patient: json['patient'] != null
          ? PatientModel.fromJson(json['patient'])
          : null,
    );
  }
}
class PatientModel {
  final int id;
  final int userId;
  final String firstName;
  final String fatherName;
  final String lastName;
  final String gender;
  final String birthDate;
  final String nationalNumber;
  final String address;
  final String phone;
  final String email;

  PatientModel({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.fatherName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    required this.nationalNumber,
    required this.address,
    required this.phone,
    required this.email,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      userId: json['user_id'],
      firstName: json['first_name'],
      fatherName: json['father_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      birthDate: json['birth_date'],
      nationalNumber: json['national_number'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
