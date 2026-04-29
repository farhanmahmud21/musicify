import 'package:flutter/material.dart';
import 'package:spotify/app/app_routes.dart';
import 'package:spotify/app/main_bottom.dart';
import 'package:spotify/features/album/ui/screens/album_list_screen.dart';
import 'package:spotify/features/home/ui/screens/home_screen.dart';
import 'package:spotify/features/auth/ui/screens/login_screen.dart';
import 'package:spotify/features/auth/ui/screens/signup_screen.dart';
import 'package:spotify/features/music/ui/screens/music_detail.dart';
import 'package:spotify/splashScreen.dart';

class musicify extends StatelessWidget {
  const musicify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Splashscreen.name,
      onGenerateRoute: AppRoutes.getAppRoutes,
    );
  }
}
