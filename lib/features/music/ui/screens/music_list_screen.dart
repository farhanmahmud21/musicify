import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});
  static final name = '/album-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Songs',
          style: GoogleFonts.hurricane(
            textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.w900,
              fontSize: 40,
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        automaticallyImplyActions: false,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text('Song Name'),
          leading: Icon(Iconsax.music_copy),
          subtitle: Text(
            'Artist Name',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),

          iconColor: Colors.amberAccent,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Iconsax.music_library_2, size: 22),
              SizedBox(width: 4),
              Text('Album Name'),
            ],
          ),
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
      ),
    );
  }
}
