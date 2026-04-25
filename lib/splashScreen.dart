import 'package:flutter/material.dart';
import 'package:spotify/app/assets_path.dart';
import 'package:spotify/features/auth/ui/screens/signup_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  static final name = '/';

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<void> moveToNextPage() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, SignupScreen.name);
  }

  @override
  void initState() {
    super.initState();
    moveToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Image.asset(AppAssetsPath.appLogo))),
    );
  }
}
