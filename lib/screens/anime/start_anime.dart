import 'package:flutter/material.dart';

class StartAnime extends StatelessWidget {
  const StartAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/anime_bg.webp",
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "anime");
            },
            child: Container(
              margin: const EdgeInsets.only(top: 200.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  )),
              height: 50,
              width: 300,
              child: const Text(
                "Start Watching",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
