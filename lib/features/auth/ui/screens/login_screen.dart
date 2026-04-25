import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:spotify/app/assets_path.dart';
import 'package:spotify/features/home/ui/screens/home_screen.dart';
import 'package:spotify/features/auth/ui/screens/signup_screen.dart';
import 'package:spotify/features/auth/ui/widgets/continue_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
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
            "Welcome Back! ",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),

          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    // fillColor: Colors.white,
                    // filled: true,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ContinueButton(context),
                SizedBox(height: 8),
                Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 8),
                OtherSignUpButton(Iconsax.google_1, "Continue with Google"),
                SizedBox(height: 8),
                OtherSignUpButton(Iconsax.facebook, "Continue with Facebook"),
                SizedBox(height: 8),
                Text('Don\'t have an account', style: TextStyle(fontSize: 14)),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, SignupScreen.name);
                  },
                  child: Text(
                    "Sign Up",
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
}
