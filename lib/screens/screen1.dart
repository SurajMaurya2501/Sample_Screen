import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _courseImages = [
    "assets/css.png",
    "assets/flutter.png",
    "assets/html.png",
    "assets/python.png"
  ];

  final List<String> _courseNames = ["CSS3", "Flutter", "HTML5", "Python"];

  List<IconData> icons = [
    Icons.category,
    Icons.class_,
    Icons.golf_course,
    Icons.book,
    Icons.live_help,
    Icons.leaderboard
  ];
  List<Color> colorList = [
    Colors.yellow,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.purpleAccent,
    Colors.green
  ];

  List<String> labels = [
    "Category",
    "Classes",
    "Free Courses",
    "Book Store",
    "Live Courses",
    "LeaderBoard"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 82, 30, 224),
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(
                    25.0,
                  ),
                  bottomStart: Radius.circular(
                    25.0,
                  ),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Hi, Programmer",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: "Search here...",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: colorList[index],
                        radius: 28,
                        child: Icon(
                          icons[index],
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        labels[index],
                        style:
                            const TextStyle(fontSize: 13, color: Colors.black),
                      )
                    ],
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Courses",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 82, 30, 224),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
              primary: false,
              // physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _courseImages[index],
                        height: 70,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          _courseNames[index],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("Vidoes ${index + 5}")
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
