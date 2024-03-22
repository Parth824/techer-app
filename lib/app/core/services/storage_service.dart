import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  static late SharedPreferences _pref;
  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> clear() async {
    _pref.clear();
  }

  /// SET

  static Future<void> setToken(String? token) async {
    if (token != null) {
      await _pref.setString(_StorageKeys.usrToken, token);
    } else {
      await _pref.remove(_StorageKeys.usrToken);
    }
  }

  static Future<void> setUserId(String? token) async {
    if (token != null) {
      await _pref.setString(_StorageKeys.usrId, token);
    } else {
      await _pref.remove(_StorageKeys.usrId);
    }
  }

  static Future<void> setTheme(String? mode) async {
    if (mode != null) {
      await _pref.setString(_StorageKeys.theme, mode);
    } else {
      await _pref.remove(_StorageKeys.theme);
    }
  }

  static Future<void> setTecUniqeCode(String? mode) async {
    if (mode != null) {
      await _pref.setString(_StorageKeys.tecUniqueCode, mode);
    } else {
      await _pref.remove(_StorageKeys.tecUniqueCode);
    }
  }

  static Future<void> setTecCoureId(String? mode) async {
    if (mode != null) {
      await _pref.setString(_StorageKeys.tecCourseId, mode);
    } else {
      await _pref.remove(_StorageKeys.tecCourseId);
    }
  }

  static Future<void> setTecToken(String? mode) async {
    if (mode != null) {
      await _pref.setString(_StorageKeys.tecToken, mode);
    } else {
      await _pref.remove(_StorageKeys.tecToken);
    }
  }

  static Future<void> setTecId(String? mode) async {
    if (mode != null) {
      await _pref.setString(_StorageKeys.tecId, mode);
    } else {
      await _pref.remove(_StorageKeys.tecId);
    }
  }

  static Future<void> setTecLogin(bool? mode) async {
    if (mode != null) {
      await _pref.setBool(_StorageKeys.tecLogin, mode);
    } else {
      await _pref.remove(_StorageKeys.tecLogin);
    }
  }

  static Future<void> setGroupId(String? mode) async {
    if (mode != null) {
      await _pref.setString(_StorageKeys.tecGroupId, mode);
    } else {
      await _pref.remove(_StorageKeys.tecGroupId);
    }
  }

  /// GET

  static String? getToken() {
    return _pref.getString(_StorageKeys.usrToken);
  }

  static String? getUserId() {
    return _pref.getString(_StorageKeys.usrId);
  }

  static String? getTheme() {
    return _pref.getString(_StorageKeys.theme);
  }

  static String? getTecUniqeCode() {
    return _pref.getString(_StorageKeys.tecUniqueCode);
  }

  static String? getTecCoureId() {
    return _pref.getString(_StorageKeys.tecCourseId);
  }

  static String? getTecToken() {
    return _pref.getString(_StorageKeys.tecToken);
  }

  static String? getTecId() {
    return _pref.getString(_StorageKeys.tecId);
  }

  static String? getTecGroupId() {
    return _pref.getString(_StorageKeys.tecGroupId);
  }

  static bool? getTecLogin() {
    return _pref.getBool(_StorageKeys.tecLogin);
  }
  // REMOVE

  static Future<bool> clearUserToken() async {
    return await _pref.remove(_StorageKeys.usrToken);
  }

  static Future<bool> clearCoreId() async {
    return await _pref.remove(_StorageKeys.tecCourseId);
  }

  static Future<bool> clearTecToken() async {
    return await _pref.remove(_StorageKeys.tecToken);
  }

  static Future<bool> clearUserId() async {
    return await _pref.remove(_StorageKeys.usrId);
  }

  static Future<bool> clearTecUniqeCode() async {
    return await _pref.remove(_StorageKeys.tecUniqueCode);
  }

  static Future<bool> clearTecLogin() async {
    return await _pref.remove(_StorageKeys.tecLogin);
  }

  static Future<bool> clearTecId() async {
    return await _pref.remove(_StorageKeys.tecId);
  }

  static Future<bool> clearGroupId() async {
    return await _pref.remove(_StorageKeys.tecGroupId);
  }
}

abstract class _StorageKeys {
  static const usrToken = 'USRTOKEN';
  static const tecToken = 'TECTOKEN';
  static const usrId = 'USER-ID';
  static const theme = 'theme';
  static const tecUniqueCode = 'TECUNIQUECODE';
  static const tecCourseId = 'TECCOURSEID';
  static const tecLogin = 'TECLOGIN';
  static const tecId = 'TEACHER-ID';
  static const tecGroupId = 'TECGROUPID';
}
