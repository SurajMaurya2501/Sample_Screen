import 'package:flutter/material.dart';

class ReverseScreen extends StatefulWidget {
  const ReverseScreen({super.key});

  @override
  State<ReverseScreen> createState() => _ReverseScreenState();
}

class _ReverseScreenState extends State<ReverseScreen> {
  final _controller = TextEditingController();
  String reversedString = '';
  bool isReversed = false;

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
          "Reverse String",
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
                  hintText: "Enter Your String",
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
                reverseString(
                  _controller.text,
                );
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
                  "Reverse",
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
                isReversed ? reversedString : "Get Output Here....",
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

  void reverseString(String inputString) {
    isReversed = true;
    reversedString = '';
    for (int i = inputString.length - 1; i >= 0; i--) {
      reversedString += inputString[i];
      print(reversedString);
    }
    _controller.clear();
    setState(() {});
  }
}
