
class ConsultationModel {
  final int id;
  final int specialtyId;
  final int patientId;
  final String question;
  final String createdAt;
  final String updatedAt;
  final PatientModel patient;

  ConsultationModel({
    required this.id,
    required this.specialtyId,
    required this.patientId,
    required this.question,
    required this.createdAt,
    required this.updatedAt,
    required this.patient,
  });

  factory ConsultationModel.fromJson(Map<String, dynamic> json) {
    return ConsultationModel(
      id: json['id'],
      specialtyId: json['specialty_id'],
      patientId: json['patient_id'],
      question: json['question'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      patient: PatientModel.fromJson(json['patient']),
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
  final String socialStatus;
  final String emergencyNum;
  final String insuranceCompany;
  final String insuranceNum;
  final int smoker;
  final int pregnant;
  final String bloodType;
  final String geneticDiseases;
  final String chronicDiseases;
  final String drugAllergy;
  final String lastOperations;
  final String presentMedicines;
  final String status;
  final String createdAt;
  final String updatedAt;

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
    required this.socialStatus,
    required this.emergencyNum,
    required this.insuranceCompany,
    required this.insuranceNum,
    required this.smoker,
    required this.pregnant,
    required this.bloodType,
    required this.geneticDiseases,
    required this.chronicDiseases,
    required this.drugAllergy,
    required this.lastOperations,
    required this.presentMedicines,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
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
      socialStatus: json['social_status'],
      emergencyNum: json['emergency_num'],
      insuranceCompany: json['insurance_company'],
      insuranceNum: json['insurance_num'],
      smoker: json['smoker'],
      pregnant: json['pregnant'],
      bloodType: json['blood_type'],
      geneticDiseases: json['genetic_diseases'],
      chronicDiseases: json['chronic_diseases'],
      drugAllergy: json['drug_allergy'],
      lastOperations: json['last_operations'],
      presentMedicines: json['present_medicines'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
