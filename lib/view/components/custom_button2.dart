import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({super.key, required this.title,required this.onTap});

  final String title;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Ink(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(minHeight: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/google.png',height: 18),
                        Text(title,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    )))));
  }
}
