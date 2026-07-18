import 'package:flutter/material.dart';

class PasswordStrength extends StatelessWidget {
  final String password;

  const PasswordStrength({
    super.key,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      password.isEmpty
          ? ''
          : 'Password length: ${password.length}',
    );
  }
}