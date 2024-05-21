import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing_app/screens/StringScreen/distance.dart';
import 'package:testing_app/screens/StringScreen/palindrome.dart';
import 'package:testing_app/screens/StringScreen/prime_number.dart';
import 'package:testing_app/screens/StringScreen/reverse.dart';

class StringScreen extends StatelessWidget {
  const StringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabNames = [
      "Reverse",
      "Distance",
      "Prime Number",
      "Find Palindome",
    ];

    List<String> lottieIcons = [
      "assets/lottie/reverse_string.json",
      "",
      "assets/lottie/prime_number.json",
      "assets/lottie/find_palindrome.json"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: const Text("String Funtions",
        ),
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: tabNames.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => index == 0
                              ? const ReverseScreen()
                              : index == 1
                                  ? const DistanceScreen()
                                  : index == 2
                                      ? const PrimeNumber()
                                      : const PalindromeScreen()));
                },
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        index == 1
                            ? const Icon(
                                Icons.social_distance,
                                size: 30,
                                color: Colors.deepOrangeAccent,
                              )
                            : Lottie.asset(
                                lottieIcons[index],
                                height: 50,
                              ),
                        Text(tabNames[index])
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
