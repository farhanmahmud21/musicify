import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AlbumListScreen extends StatelessWidget {
  const AlbumListScreen({super.key});
  static final name = '/album-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Albums',
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
          title: Text('Album Name'),
          leading: Icon(Iconsax.music_library_2),
          subtitle: Text(
            'Artist Name',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),

          iconColor: Colors.green,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Iconsax.music, size: 22),
              SizedBox(width: 4),
              Text('4'),
            ],
          ),
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
      ),
    );
  }
}
