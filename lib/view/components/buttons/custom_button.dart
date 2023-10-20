import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      double? borderRadius,
      double? verticalPadding,
      TextStyle? textStyle,
      String? icon,
      Color? textColor,
      List<Color>? color})
      : _borderRadius = borderRadius ?? 50,
        _verticalPadding = verticalPadding ?? 8,
        _icon = icon,
        _color = color ?? [AppTheme.blueColor, AppTheme.purpleColor],
        _textColor = textColor ?? AppTheme.whiteColor,
        _textStyle =
            textStyle ?? Theme.of(Get.context!).textTheme.displayLarge!;

  final String title;
  final onTap;
  final double _borderRadius;
  final double _verticalPadding;
  final List<Color> _color;
  final String? _icon;
  final Color _textColor;

  final TextStyle? _textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: _verticalPadding),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: _color,
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
                    style: _textStyle!.copyWith(color: _textColor),
                    textAlign: TextAlign.center)
              ],
            )));
  }
}
