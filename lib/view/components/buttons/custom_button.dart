import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      double? borderRadius,
      String? icon})
      : _borderRadius = borderRadius ?? 50,
        _icon = icon;

  final String title;
  final onTap;
  final double _borderRadius;
  final String? _icon;

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
                borderRadius: BorderRadius.circular(_borderRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _icon == null
                    ? const SizedBox.shrink()
                    : Image(image: AssetImage(_icon!), height: 28, width: 28),
                _icon == null
                    ? const SizedBox.shrink()
                    : const SizedBox(width: 8),
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppTheme.whiteColor),
                    textAlign: TextAlign.center)
              ],
            )));
  }
}
