import 'package:flutter/material.dart';

class DistanceScreen extends StatefulWidget {
  const DistanceScreen({super.key});

  @override
  State<DistanceScreen> createState() => _DistanceScreenState();
}

class _DistanceScreenState extends State<DistanceScreen> {
  final _controller = TextEditingController();
  int distance = 0;
  bool isDistanced = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          "Distance String",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter Two Distant Strings",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                findDistance(_controller.text);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.redAccent],
                  ),
                ),
                child: const Text(
                  "Find Distance",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration:
                  BoxDecoration(color: Colors.white, border: Border.all()),
              child: Text(
                isDistanced ? distance.toString() : "Get Output Here....",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void findDistance(String inputString) {
    int counter = 0;
    distance = 0;
    isDistanced = true;
    for (int i = 0; i < inputString.length; i++) {
      if (inputString[i] == " ") {
        counter++;
      }
    }
    distance = counter;
    _controller.clear();
    setState(() {});
  }
}
