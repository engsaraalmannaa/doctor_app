class DoctorModel {
  int? status;
  String? message;
  Data? data;

  DoctorModel({this.status, this.message, this.data});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? specialtyId;
  int? userId;
  String? firstName;
  String? fatherName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? nationalNumber;
  String? address;
  String? phone;
  String? email;
  String? licenseNumber;
  String? experienceYears;
  String? meetCost;
  String? image;
  String? bio;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Data(
      {this.id,
      this.specialtyId,
      this.userId,
      this.firstName,
      this.fatherName,
      this.lastName,
      this.gender,
      this.birthDate,
      this.nationalNumber,
      this.address,
      this.phone,
      this.email,
      this.licenseNumber,
      this.experienceYears,
      this.meetCost,
      this.image,
      this.bio,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialtyId = json['specialty_id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    fatherName = json['father_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    nationalNumber = json['national_number'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    licenseNumber = json['license_number'];
    experienceYears = json['experience_years'];
    meetCost = json['meet_cost'];
    image = json['image'];
    bio = json['bio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['specialty_id'] = this.specialtyId;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['father_name'] = this.fatherName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['national_number'] = this.nationalNumber;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['license_number'] = this.licenseNumber;
    data['experience_years'] = this.experienceYears;
    data['meet_cost'] = this.meetCost;
    data['image'] = this.image;
    data['bio'] = this.bio;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
