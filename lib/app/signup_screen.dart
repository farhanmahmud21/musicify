import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:spotify/app/assets_path.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static final name = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Container(child: Image.asset(AppAssetsPath.loginLogo))),

          Text(
            "Millions of Songs",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            "Free on Musicify",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              children: [
                signUpButton(),
                SizedBox(height: 8),
                OtherSignUpButton(
                  Icons.phone_android,
                  "Continue with phone number",
                ),
                SizedBox(height: 8),
                OtherSignUpButton(Iconsax.google_1, "Continue with Google"),
                SizedBox(height: 8),
                OtherSignUpButton(Iconsax.facebook, "Continue with Facebook"),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget OtherSignUpButton(IconData icon, String text) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            SizedBox(width: 20),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUpButton() {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),

        onPressed: () {},
        child: Text(
          'Sign Up Free',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
