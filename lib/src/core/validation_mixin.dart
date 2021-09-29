import 'package:get/get.dart';

class ValidationMixin {
  String validateNotEmpty(String value) =>
      value.isEmpty ? 'Field cannot be empty' : null;

  String validateEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  String validateNotNullEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return value.isEmpty
        ? null
        : !emailValid
            ? 'Enter a Valid Email Address'
            : null;
  }

  String validatePassword(String value) =>
      value.length < 6 ? 'Password should be more than 5 Characters' : null;
    // value != passwordController.text ? 'Password dont match': null;
}