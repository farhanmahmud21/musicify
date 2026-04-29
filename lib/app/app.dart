import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/app/app_routes.dart';
import 'package:spotify/features/common/ui/controllers/main_bottom_navbar_controller.dart';
import 'package:spotify/features/common/ui/screens/main_bottom.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainBottomNavbarController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: Splashscreen.name,
        onGenerateRoute: AppRoutes.getAppRoutes,
      ),
    );
  }
}
