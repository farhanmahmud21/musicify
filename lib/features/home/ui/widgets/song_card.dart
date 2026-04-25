import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final String? albumName;

  const SongCard({
    super.key,
    required this.songTitle,
    required this.artistName,
    this.albumName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),

          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 4,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => Card(
            elevation: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // decoration: BoxDecoration(color: Colors.blue),
                  child: Container(
                    height: 140,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Center(child: Text(songTitle)),
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(artistName),
                    ),
                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 6),
                      child: Text(
                        albumName ?? '',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
