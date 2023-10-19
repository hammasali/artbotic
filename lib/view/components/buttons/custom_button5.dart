import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class CustomButton5 extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final onTap;

  const CustomButton5(
      {super.key,
      required this.isSelected,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: isSelected ? AppTheme.pinkColor : null,
                border:
                    isSelected ? null : Border.all(color: AppTheme.pinkColor),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Image.asset(icon,
                color: Theme.of(context).iconTheme.color, height: 40)));
  }
}
