import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spotify/features/common/ui/controllers/main_bottom_navbar_controller.dart';
import 'package:spotify/features/home/ui/widgets/album_card.dart';
import 'package:spotify/features/home/ui/widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static final name = '/home_screen';

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MainBottomNavbarController>();
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                topBar(),
                SizedBox(height: 12),
                CategoryTitle('Album', 'See All', controller.moveToAlbum),
                albumCard(
                  albumTitle: 'Album ',
                  artistName: 'Name',
                  songAmount: 4,
                ),
                CategoryTitle('Songs', 'See All', controller.moveToMusic),
                SongCard(
                  songTitle: "Song Name",
                  artistName: "A Name",
                  albumName: 'New Album',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CategoryTitle(String title, String sub, VoidCallback onTap) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text(
            sub,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget topBar() {
    return Row(
      children: [
        Text(
          "Made for you",
          style: GoogleFonts.almendra(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
        IconButton(onPressed: () {}, icon: Icon(Iconsax.setting_2)),
      ],
    );
  }
}
