class AllTypeValidator {
  static String? validateString(String? value, String mess) {
    if (value == null || value.isEmpty) {
      return mess;
    }
    return null;
  }

  static String? validateNumber(String? value, String mess) {
    if (value == null || value.isEmpty) {
      return mess;
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  static String? validateMobile(String? value, String mess) {
    if (value?.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value, String mess) {
    var regEx = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value == null || value.isEmpty) {
      return mess;
    }
    if (!regEx.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value, String mess) {
    if (value == null || value.isEmpty) {
      return mess;
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, String? value2, String mess) {
    if (value == null || value.isEmpty) {
      return mess;
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (value != value2) {
      return 'Password must be Same';
    }

    return null;
  }
}
