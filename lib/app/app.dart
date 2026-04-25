import 'package:flutter/material.dart';
import 'package:spotify/app/signup_screen.dart';
import 'package:spotify/splashScreen.dart';

class musicify extends StatelessWidget {
  const musicify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Splashscreen.name,
      onGenerateRoute: (RouteSettings settings) {
        late final screenWidget;

        if (settings.name == Splashscreen.name) {
          screenWidget = Splashscreen();
        }

        if (settings.name == SignupScreen.name) {
          screenWidget = SignupScreen();
        }

        return MaterialPageRoute(builder: (context) => screenWidget);
      },
    );
  }
}
