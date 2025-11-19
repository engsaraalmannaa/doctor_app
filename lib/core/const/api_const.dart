class ApiConst {
  static const baseUrl = 'https://f59b011626bc.ngrok-free.app';

  static const login = '/api/doctor/login';

  static const consultations = '/api/doctor/consultations-by-specialty';
  //static showconsultation({required int id}) => '/api/doctor/consultations/$id/show';

  static consultationsAnswer({required String id}) =>
      '/api/doctor/consultations/$id/answer';

  static const appointments = '/api/doctor/appointments';
  static const doctorstatus = '/api/admin/appointments/store';
  static const doctorprofile = '/api/doctor/profile';
}
