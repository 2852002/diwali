
class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegExp = RegExp(
      r'^[^@]+@[^@]+\.[^@]+$',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

    // Validate mobile number
  static String? validateMobileNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    final mobileNoRegExp = RegExp(r'\d{10}$');
    if (!mobileNoRegExp.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  // Validate bill number
  static String? validateBillNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the bill number';
    }
    // Add more validation if needed
    return null;
  }

  // Validate value
  static String? validateValue(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the value';
    }
    final valueRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!valueRegExp.hasMatch(value)) {
      return 'Please enter a valid value';
    }
    return null;
}
// Validation for mobile number
static String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter mobile number';
  }
  if (value.length < 10) {
    return 'Mobile number must be at least 10 digits';
  }
  return null;
}

  // Validate first name
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  // Validate last name
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  // Validate address
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
}
}