import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:spotify/features/home/ui/widgets/album_card.dart';
import 'package:spotify/features/home/ui/widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final name = '/home_screen';
  @override
  Widget build(BuildContext context) {
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
                CategoryTitle('Album', 'See All'),
                albumCard(
                  albumTitle: 'Album ',
                  artistName: 'Name',
                  songAmount: 4,
                ),
                CategoryTitle('Songs', 'See All'),
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

  Widget CategoryTitle(String title, String sub) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
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
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
        IconButton(onPressed: () {}, icon: Icon(Iconsax.setting_2)),
      ],
    );
  }
}
