import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              visualDensity: VisualDensity.adaptivePlatformDensity,
                primary: null, // Set primary color to null to remove the background color
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Ink(
                decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
                      AppTheme.blueColor,
                      AppTheme.purpleColor,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(minHeight: 50.0),
                    child: Text(title,
                        style: Theme.of(context).textTheme.displayLarge)))));
  }
}
