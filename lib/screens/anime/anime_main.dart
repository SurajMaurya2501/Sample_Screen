import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:testing_app/screens/anime/anime_watch.dart';

class AnimeMainScreen extends StatefulWidget {
  const AnimeMainScreen({super.key});

  @override
  State<AnimeMainScreen> createState() => _AnimeMainScreenState();
}

class _AnimeMainScreenState extends State<AnimeMainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool isNight = false;
  int selectedTabIndex = 0;

  final Map<String, dynamic> posterMapData = {
    "Bungo Stray Dogs": "assets/anime_poster/bungoStrayDogs.jpg",
    "Clannad": "assets/anime_poster/clannad.jpg",
    "Death Note": "assets/anime_poster/deathNote.jpg",
    "Demon Slayer": "assets/anime_poster/demonSlayer.jpg",
    "Dragon Ball Z": "assets/anime_poster/dragonBallZ.jpg",
    "Hunter X Hunter": "assets/anime_poster/hunterXhunter.jpg",
    "Jujutsu Kaisen": "assets/anime_poster/jujutsuKaisen.jpg",
    "Naruto Shippuden": "assets/anime_poster/naruto.webp",
    "Sword Of Strangers": "assets/anime_poster/swordOfStranger.jpg"
  };

  Map<String, dynamic> searchedList = {};

  final List<String> _animePosters = [
    "assets/anime_poster/bungoStrayDogs.jpg",
    "assets/anime_poster/clannad.jpg",
    "assets/anime_poster/deathNote.jpg",
    "assets/anime_poster/demonSlayer.jpg",
    "assets/anime_poster/dragonBallZ.jpg",
    "assets/anime_poster/hunterXhunter.jpg",
    "assets/anime_poster/jujutsuKaisen.jpg",
    "assets/anime_poster/naruto.webp",
    "assets/anime_poster/swordOfStranger.jpg"
  ];

  final List<String> _animeNameList = [
    "Bungo Stray Dogs",
    "Clannad",
    "Death Note",
    "Demon Slayer",
    "Dragon Ball Z",
    "Hunter X Hunter",
    "Jujutsu Kaisen",
    "Naruto Shippuden",
    "Sword Of Strangers",
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playHalfAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    }
    if (isNight == false) {
      _controller
        ..reset()
        ..forward();
      // Stop animation halfway
      Future.delayed(
          Duration(
              milliseconds: (_controller.duration!.inMilliseconds / 2).floor()),
          () {
        _controller.stop();
      });
    } else if (isNight = true) {
      Future.delayed(
          Duration(
              milliseconds: (_controller.duration!.inMilliseconds / 2).floor()),
          () {
        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isNight ? Colors.black : Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              InkWell(
                onTap: () {
                  _playHalfAnimation();
                  Future.delayed(
                      const Duration(
                        milliseconds: 1000,
                      ), () {
                    isNight = !isNight;
                    setState(() {});
                  });
                },
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Lottie.asset(
                      "assets/lottie/day_night_mode.json",
                      controller: _controller,
                    );
                  },
                ),
              )
            ],
            backgroundColor: isNight ? Colors.black : Colors.white,
            floating: true,
            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  bottom: 15.0,
                ),
                alignment: Alignment.bottomCenter,
                child: TextField(
                  style: TextStyle(
                    color: isNight ? Colors.white : Colors.black,
                  ),
                  onChanged: (value) {
                    if (mounted) {
                      Future.delayed(
                        const Duration(
                          milliseconds: 500,
                        ),
                        () {
                          getSearchData(value);
                          setState(() {});
                        },
                      );
                    }
                  },
                  cursorColor: isNight ? Colors.white : Colors.black,
                  decoration: InputDecoration(
                    hintText: "Search Anime here...",
                    prefixIcon: Icon(
                      Icons.search,
                      color: isNight ? Colors.white : Colors.black,
                    ),
                    hintStyle: TextStyle(
                      color: isNight ? Colors.white : Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      borderSide: BorderSide(
                        color: isNight ? Colors.white : Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      borderSide: BorderSide(
                        color: isNight ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              "AnimeFav",
              style: GoogleFonts.adamina(
                  fontWeight: FontWeight.bold,
                  color: isNight ? Colors.white : Colors.black),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  childCount: searchedList.isEmpty ? 9 : searchedList.length,
                  //  searchedList.isEmpty ? 9 : searchedList.length,
                  (context, index) {
                final poster = searchedList.isEmpty
                    ? posterMapData.values.elementAt(index)
                    : searchedList.values.elementAt(index);
                final name = searchedList.isEmpty
                    ? posterMapData.keys.elementAt(index)
                    : searchedList.keys.elementAt(index);
                return TweenAnimationBuilder(
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimeWatchScreen(
                                imagePath: poster,
                                tab: "image$index",
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      5.0,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Hero(
                                    tag: "image$index",
                                    child: Image.asset(
                                      poster,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Expanded(
                              child: Text(
                                name,
                                style: GoogleFonts.b612(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 210,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getSearchData(String enteredText) async {
    searchedList.clear();
    posterMapData.keys.every((element) {
      if (element.toUpperCase().contains(enteredText.toUpperCase())) {
        // print("value - ${posterMapData[element]}");
        searchedList[element] = posterMapData[element];
      }
      return true;
    });
  }
}
