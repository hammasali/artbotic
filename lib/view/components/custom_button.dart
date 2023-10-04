import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onTap});

  final String title;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [AppTheme.blueColor, AppTheme.purpleColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50)),
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppTheme.whiteColor),
                textAlign: TextAlign.center)));
  }
}
