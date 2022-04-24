import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({Key? key}) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: 'Password',
          suffix: InkWell(
              onTap: () => setState(() => _obscureText = !_obscureText),
              child:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off)),
        ));
  }
}
