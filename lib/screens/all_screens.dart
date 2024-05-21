import 'package:flutter/material.dart';
import 'package:testing_app/screens/StringScreen/string_screen.dart';
import 'package:testing_app/screens/anime/anime_main.dart';
import 'package:testing_app/screens/anime/start_anime.dart';
import 'package:testing_app/screens/screen1.dart';

class AllScreens extends StatefulWidget {
  const AllScreens({super.key});

  @override
  State<AllScreens> createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  int selectedTabIndex = 0;
  Widget selectedScreen = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            selectedTabIndex = value;
            showScreen(selectedTabIndex);
            setState(() {});
          },
          currentIndex: selectedTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
              ),
              label: "Movie",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
              ),
              label: "Book",
            )
          ]),
      body: showScreen(selectedTabIndex),
    );
  }

  Widget showScreen(int index) {
    switch (index) {
      case 0:
        return selectedScreen = const HomeScreen();
      case 1:
        return selectedScreen = const StartAnime();
      default:
        return selectedScreen = const StringScreen();
    }
  }
}
