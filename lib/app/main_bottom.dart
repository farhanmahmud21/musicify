import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:spotify/features/home/ui/screens/home_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});
  static final name = '/main_nav';

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final Screens = [HomeScreen()];
    int selectedIndex = 0;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 4,
        onDestinationSelected: (int index) {
          setState(() {});
          selectedIndex = index;
        },
        destinations: [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Iconsax.music_playlist),
            label: 'Album',
          ),
          NavigationDestination(icon: Icon(Iconsax.music), label: 'Music'),
        ],
      ),

      body: Screens[selectedIndex],
    );
  }
}
