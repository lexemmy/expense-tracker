import 'package:flutter/foundation.dart';

class SignupParams {
  final String emailAddress;
  final String password;
  final String name;

  SignupParams({
    @required this.emailAddress,
    @required this.password,
    @required this.name,
  });
}


