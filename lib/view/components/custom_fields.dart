import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: TextField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.titleMedium,
                hintText: hintText,
                contentPadding: const EdgeInsets.all(16.0),
                border: InputBorder.none,
                suffixIcon: Icon(obscureText ? Icons.visibility : null,
                    color: Colors.grey))));
  }
}
