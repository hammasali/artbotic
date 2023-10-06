import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class CustomButton3 extends StatelessWidget {
  const CustomButton3(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.text,
      required this.icon});

  final onTap;
  final bool isSelected;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: isSelected
                        ? AppTheme.purpleColor
                        : Theme.of(context).iconTheme.color!,
                    width: isSelected ? 2.0 : 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                padding: const EdgeInsets.symmetric(vertical: 4.0)),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage(icon),
                      height: 18,
                      width: 18,
                      color: isSelected
                          ? AppTheme.purpleColor
                          : Theme.of(context).iconTheme.color),
                  const SizedBox(width: 8),
                  Text(text,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: isSelected ? AppTheme.purpleColor : null))
                ])));
  }
}
