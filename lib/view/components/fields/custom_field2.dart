import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class CustomTextField2 extends StatelessWidget {
  final String hintText;
  final Color borderColor;

  const CustomTextField2(
      {super.key,
      required this.hintText,
      this.borderColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
          cursorColor: AppTheme.purpleColor,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).hintColor),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: borderColor, width: 2.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor)),
              filled: true,
              fillColor: Colors.transparent),
          minLines: 5,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            print(value);
          }),
    );
  }
}
