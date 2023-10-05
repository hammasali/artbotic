import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  bool isSelected = false;
  Color borderColor = Colors.grey;
  Color textColor = Colors.black;

  void toggleButton() {
    setState(() {
      isSelected = !isSelected;
      if (isSelected) {
        borderColor = Colors.blue;
        textColor = Colors.white;
      } else {
        borderColor = Colors.grey;
        textColor = Colors.grey;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            OutlinedButton(
                onPressed: toggleButton,
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: borderColor, width: 2.0),
                    // use the border color variable
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: const EdgeInsets.all(16.0)),
                child:
                    Text('Custom Button', style: TextStyle(color: textColor))),
            const Spacer(),
            OutlinedButton(
              onPressed: toggleButton,
              child: Text('Custom Button', style: TextStyle(color: textColor)),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: borderColor, width: 2.0),
                  // use the border color variable
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(16.0)),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: toggleButton,
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: borderColor, width: 2.0),
                  // use the border color variable
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(16.0)),
              child: Text('Custom Button', style: TextStyle(color: textColor)),
            ),
          ],
        ),
      ],
    );
  }
}
