import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    super.key,
    this.text = '',
    required this.label,
    this.onPressed,
  });

  final String text;
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (text != '') Text(text),
        TextButton(
          onPressed: onPressed,
          child: Text(label),
        ),
      ],
    );
  }
}
