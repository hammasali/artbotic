import 'package:artbotic/utils/app_const.dart';
import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    // Button is disabled, set background color to transparent
                    return Colors.transparent;
                  }
                  // Button is enabled, set background color to primary color
                  return Theme.of(context).primaryColor;
                })),
            child: Ink(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(minHeight: 50.0),
                    child: FittedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Image.asset(AppConsts.google, height: 18),
                          const SizedBox(width: 5),
                          Text(title,
                              style: Theme.of(context).textTheme.bodyLarge)
                        ]))))));
  }
}
