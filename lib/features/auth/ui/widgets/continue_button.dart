import 'package:flutter/material.dart';
import 'package:spotify/features/common/ui/screens/main_bottom.dart';
import 'package:spotify/features/home/ui/screens/home_screen.dart';

Widget ContinueButton(BuildContext context) {
  return SizedBox(
    height: 56,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),

      onPressed: () {
        Navigator.pushNamed(context, MainBottomNavBar.name);
      },
      child: Text(
        'Continue',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
    ),
  );
}
