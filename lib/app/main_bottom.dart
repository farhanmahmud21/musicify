import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:spotify/features/album/ui/screens/album_list_screen.dart';
import 'package:spotify/features/home/ui/screens/home_screen.dart';
import 'package:spotify/features/music/ui/screens/music_list_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});
  static final name = '/main_nav';

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int selectedIndex = 0;
  final Screens = [HomeScreen(), MusicListScreen(), AlbumListScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 4,
        shadowColor: Colors.purple,

        indicatorColor: Colors.green,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Iconsax.home,
              color: selectedIndex == 0 ? Colors.black87 : Colors.green,
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
              color: selectedIndex == 2 ? Colors.black87 : Colors.green,
            ),
            label: 'Album',
          ),
        ],
      ),

      body: Screens[selectedIndex],
    );
  }
}
