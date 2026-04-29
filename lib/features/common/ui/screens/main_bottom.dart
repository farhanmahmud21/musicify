import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spotify/features/album/ui/screens/album_list_screen.dart';
import 'package:spotify/features/common/ui/controllers/main_bottom_navbar_controller.dart';
import 'package:spotify/features/home/ui/screens/home_screen.dart';
import 'package:spotify/features/music/ui/screens/music_list_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});
  static final name = '/main_nav';

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MainBottomNavbarController>();
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 4,
        shadowColor: Colors.purple,

        indicatorColor: Colors.green,
        selectedIndex: controller.activeIndex,
        onDestinationSelected: controller.changeIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Iconsax.home,
              color: controller.activeIndex == 0
                  ? Colors.black87
                  : Colors.green,
            ),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Iconsax.music, color: Colors.green),
            label: 'Music',
            selectedIcon: Icon(Iconsax.music, color: Colors.black87),
          ),
          NavigationDestination(
            icon: Icon(
              Iconsax.music_playlist,
              color: controller.activeIndex == 2
                  ? Colors.black87
                  : Colors.green,
            ),
            label: 'Album',
          ),
        ],
      ),

      body: controller.Screens[controller.activeIndex],
    );
  }
}
