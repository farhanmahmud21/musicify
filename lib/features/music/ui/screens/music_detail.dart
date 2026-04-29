import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:just_audio/just_audio.dart';

class MusicDetailScreen extends StatefulWidget {
  const MusicDetailScreen({super.key, required this.songName});
  final String songName;

  static final name = '/music-detail';

  @override
  State<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends State<MusicDetailScreen> {
  // 1. Create the audio player instance
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  void initAudio() async {
    try {
      await player.setUrl(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      );
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  void handlePlayPause() async {
    if (player.playing) {
      await player.pause();
    } else {
      await player.play();
    }
  }

  String formatDuration(Duration duration) {
    final minute = duration.inMinutes.toString();
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, "0");
    return "$minute:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.songName,
          style: GoogleFonts.zillaSlab(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.greenAccent,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<Duration?>(
              stream: player.durationStream,
              builder: (context, durationSnapshot) {
                final duration = durationSnapshot.data ?? Duration.zero;
                return StreamBuilder<Duration>(
                  stream: player.positionStream,
                  builder: (context, positionSnapshot) {
                    final position = positionSnapshot.data ?? Duration.zero;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 350,
                          child: Image.network(
                            'https://imgs.search.brave.com/6ZiNrBRApMttX-3_ybT1od7D8ycFVYfzQ6mhfkFEvio/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9ncnVu/Z2UtbXVzaWNhbC1i/YWNrZ3JvdW5kLWdy/dW5nZS1tdXNpY2Fs/LWJhY2tncm91bmQt/b2xkLXBhcGVyLXRl/eHR1cmUtbXVzaWMt/bm90ZXMtMjA3NTM5/ODM3LmpwZw',
                          ),
                        ),
                        SizedBox(height: 30),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.green,

                            activeTrackColor: Colors.green,
                          ),
                          child: Slider(
                            value: position.inSeconds.toDouble(),
                            max: duration.inSeconds.toDouble(),
                            onChanged: (value) {
                              player.seek(Duration(seconds: value.round()));
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              formatDuration(position),
                              style: GoogleFonts.aDLaMDisplay(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              formatDuration(duration),
                              style: GoogleFonts.aDLaMDisplay(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        StreamBuilder<PlayerState>(
                          stream: player.playerStateStream,
                          builder: (context, snapshot) {
                            return play_pause(context);
                          },
                        ),
                        SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.music_play,
                              color: Colors.green,
                              size: 42,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Playing ${widget.songName}",
                              style: GoogleFonts.actor(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Row play_pause(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(flex: 6),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  player.seek(Duration.zero);
                },
                icon: Icon(Iconsax.backward, size: 48, color: Colors.green),
              ),
              IconButton(
                onPressed: handlePlayPause,
                icon: Icon(
                  player.playing ? Iconsax.pause : Iconsax.play_circle,
                  size: 48,
                  color: Colors.green,
                ),
              ),

              IconButton(
                onPressed: () {
                  player.seek(player.duration ?? Duration.zero);
                },
                icon: Icon(Iconsax.forward, size: 48, color: Colors.green),
              ),
            ],
          ),
        ),
        Spacer(),

        volume(context),
      ],
    );
  }

  SizedBox volume(BuildContext context) {
    return SizedBox(
      width: 100,
      child: SliderTheme(
        data: SliderTheme.of(
          context,
        ).copyWith(thumbShape: HandleThumbShape(), trackHeight: 14),
        // data: SliderThemeData(
        //   thumbShape: RoundSliderOverlayShape(
        //     overlayRadius: 8,
        //   ),
        // ),
        child: Slider(
          divisions: 5,

          label: 'Volume',
          padding: EdgeInsetsGeometry.all(2),
          value: player.volume,
          min: 0.0,
          max: 1.0,
          onChanged: (value) {
            setState(() {
              player.setVolume(value);
            });
          },
          activeColor: Colors.greenAccent,
          //),
        ),
      ),
    );
  }
}
