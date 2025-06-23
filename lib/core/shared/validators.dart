class Validators {
  static String? validateEmpty(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? 'This Field is Required';
    }
    return null;
  }

  static String? validatePassword(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'This Field is Required';
    } else if (value!.length < 6) {
      return message ?? 'Password must be at least 8 characters or numbers long';
    }
    return null;
  }

  static String ? validateConfirmPassword(String ? firstValue, String ? secondValue, {String ? message}) {
    if (secondValue?.trim().isEmpty ?? true) {
      return message ?? 'This Field is Required';
    } else if (secondValue != firstValue) {
      return message ?? 'Passwords do not match';
    }
    return null;
  }

  static String ? validateUserName(String ? value,{String ? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'This Field is Required';
    } else if (value!.length < 2) {
      return message ?? 'Username must be at least 2 characters long';
    }
    return null;
  }

  static String? validateEmail(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'This Field is Required';
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.["
        r"a-zA-Z]+")
        .hasMatch(value!)) {
      return message ?? 'Email is not valid';
    }
    return null;
  }


  static String? validatePasswordConfirm(String? value, String? pass,
      {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'This Field is Required';
    } else if (value != pass) {
      return message ?? 'Passwords do not match';
    }
    return null;
  }



//   static String? validatePhoneTest(String? value, {String? fieldTitle}) {
//     if (value?.trim().isEmpty ?? true) {
//       return fieldTitle == null
//           ? LocaleKeys.fillField.tr(context: Go.context)
//           : "${LocaleKeys.filedValidation.tr()} $fieldTitle";
//     } else if (RegExp(r'[<>]').hasMatch(value!)) {
//       return LocaleKeys.scripInjectionValidate.tr(
//         context: Go.context,
//       );
//     } else if (!RegExp(r'^\d{8,15}$').hasMatch(value)) {
//       return LocaleKeys.phoneValidationLength.tr(context: Go.context);
// // return LocaleKeys.phoneValidation.tr(context: Go.context);
//     }
//     return null;
//   }
}
