import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    this.isPassword = false,
    this.isEmail = false,
    this.isOTP = false,
    required this.label,
    required this.onChanged,
    required this.validator,
    this.initialValue = '',
    required this.isLoading,
  });

  final bool isLoading;
  final bool isPassword;
  final bool isEmail;
  final bool isOTP;
  final String label;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !isLoading,
      initialValue: initialValue,
      style: Theme.of(context).textTheme.labelLarge,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isOTP
              ? TextInputType.number
              : null,
      textInputAction:
          isPassword || isOTP ? TextInputAction.go : TextInputAction.next,
      decoration: InputDecoration(
        hintText: label,
        labelText: label,
      ),
    );
  }
}
