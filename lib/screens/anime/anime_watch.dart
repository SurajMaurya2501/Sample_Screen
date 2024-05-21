import 'package:flutter/material.dart';

class AnimeWatchScreen extends StatefulWidget {
  final String tab;
  final String imagePath;
  const AnimeWatchScreen(
      {super.key, required this.tab, required this.imagePath});

  @override
  State<AnimeWatchScreen> createState() => _AnimeWatchScreenState();
}

class _AnimeWatchScreenState extends State<AnimeWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 500,
            child: Stack(
              children: [
                Hero(
                  tag: widget.tab,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  height: 100,
                  width: 100,
                  bottom: 10,
                  left: 10,
                  child: TweenAnimationBuilder(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    tween: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Image.asset(
                          "assets/play_button.png",
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
