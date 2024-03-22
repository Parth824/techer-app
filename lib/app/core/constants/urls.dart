import '../services/storage_service.dart';

abstract class CustomPaths {
  /// User
  static const String usrRegistration = '/user/registration';
  static const String usrLogin = '/user/login';
  static const String usrViewProfile = '/user/view-profile';
  static const String usrViewAll = '/user/view-all';

  /// COMPANY
  ///
  static const String cmpLogin = '/company/login';
  static const String cmpRegistration = '/company/registration';

  /// JOBS
  ///
  static const String allJobDetails = '/jobs/list';

  /// INTERNSHIP
  static const String allInternDetails = '/internship/list';

  // Teacher
  static String uniqeCode = StorageService.getTecUniqeCode() ?? "";
  static String coureId = StorageService.getTecCoureId() ?? "";
  static String techerId = StorageService.getTecId() ?? "";
  static String groupId = StorageService.getTecGroupId() ?? "";
  static String TecLogin = '/teacher/login';
  static String tecCoures(String uniqCode) => "/courses/view-by-code/$uniqCode";
  static String tecEnrolled(String coureId) => "/enrolled/user-list/$coureId";
  static String tecLecture(String coureId) =>
      "/lecture/view-by-course-id/$coureId";
  static String tecAssignment(String coureId) => "/assignment/insert/$coureId";
  static String tecAssignmentUpdate(String Id) => "/assignment/update/$Id";
      static String tecVideoAdd(String coureId) =>"/video/insert/$coureId";
  static String tecVideoUpdate(String id) =>"/video/update/$id";
  static String tecAssignmentGet = "/assignment/get-by-teacher";
  static String tecVideo = "/video/get-by-teacher";
  static String tecAssignmentDelete(String id) => "/assignment/delete/$id";
  static String tecVideoDelete(String id) => "/video/delete/$id";
  static String tecGroup(String id) => "/group/view-group/$id";
  static String ChatViewGroup(String id) => "/group/view-chat/$id";
  static String tecStartLec = "/teacher/startLecture";
}
