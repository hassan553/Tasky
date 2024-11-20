import 'package:flutter/services.dart';

class AppValidationFunctions {
  //Validation Functions for validating user input
  static String? emailValidationFunction(String? email) {
    const currentLanguage = 'en';
    if (email!.isEmpty) {
      return currentLanguage.toString() == 'ar'
          ? 'البريد الإلكتروني لا يمكن أن يكون فارغًا!'
          : "Email can't be empty!";
    }

    // Regular expression for a valid email address
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z]+$',
    );

    if (!emailRegExp.hasMatch(email)) {
      return currentLanguage.toString() == 'ar'
          ? 'الرجاء إدخال عنوان بريد إلكتروني صحيح'
          : 'Please enter a valid email address';
    }

    return null;
  }

  static String? passwordValidationFunction(String? password) {
    const currentLanguage = 'en';

    if (password == '') {
      return currentLanguage.toString() == 'ar'
          ? 'كلمة المرور لا يمكن ان تكون فارغة !'
          : "Password can't be empty";
    }
    //  else if (password!.length < 8) {
    //   return currentLanguage.toString() == 'ar'
    //       ? '!كلمة المرور يجب ان تحتوي اكثر من 8 ارقام او حروف'
    //       : "Password must have more than 8 charachters";
    //}
    else {
      return null;
    }
  }

  static String? phoneValidationFunction(String? phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\+?[\d]{7,}$');
    if (!phoneRegex.hasMatch(phoneNumber!)) {
      return 'phone number is not valid';
    }
    return null;
  }

  static String? nationalnumberValidationFunction(String? number) {
    //write regex that makes sure it has only digits an d not more than 20 digit and not smaller than 9 digits
    final RegExp reg = RegExp(r'^\d{9,20}$');
    if (!reg.hasMatch(number!)) {
      return 'enter a valid national  number';
    }
    return null;
  }

  static String? stringValidationFunction(String? fullName, String fieldName) {
    const currentLanguage = 'en';

    if (fullName == null || fullName.isEmpty) {
      return currentLanguage.toString() == 'ar'
          ? '$fieldName لا يمكن أن يكون فارغًا!'
          : "$fieldName can't be empty!";
    }

    // // Regular expression for a valid name (letters only)
    // final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]{3,50}$');

    // if (!nameRegExp.hasMatch(fullName)) {
    //   return currentLanguage.toString() == 'ar'
    //       ? 'الرجاء إدخال $fieldName صحيح (3-30 أحرف)'
    //       : 'Please enter a valid $fieldName (3-50 characters)';
    // }

    return null;
  }
}

class NoSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value contains spaces, reject it
    if (newValue.text.contains(' ')) {
      // Return the old value to prevent inserting spaces
      return oldValue;
    }
    // Otherwise, accept the new value
    return newValue;
  }
}
