import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify/features/album/ui/screens/album_list_screen.dart';
import 'package:spotify/features/home/ui/screens/home_screen.dart';
import 'package:spotify/features/music/ui/screens/music_list_screen.dart';

class MainBottomNavbarController extends ChangeNotifier {
  int _activeIndex = 0;

  List<Widget> Screens = [HomeScreen(), MusicListScreen(), AlbumListScreen()];

  get activeIndex => _activeIndex;

  void changeIndex(int value) {
    _activeIndex = value;

    notifyListeners();
  }

  void moveToMusic() {
    changeIndex(1);

    notifyListeners();
  }

  void moveToAlbum() {
    changeIndex(2);

    notifyListeners();
  }
}
