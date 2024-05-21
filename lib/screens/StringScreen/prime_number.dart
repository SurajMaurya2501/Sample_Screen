import 'package:flutter/material.dart';

class PrimeNumber extends StatefulWidget {
  const PrimeNumber({super.key});

  @override
  State<PrimeNumber> createState() => _PrimeNumberState();
}

class _PrimeNumberState extends State<PrimeNumber> {
  final _controller = TextEditingController();
  int primeNumber = 0;
  bool? isPrimeNum;

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
                  hintText: "Enter Any Number",
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
                isPrimeNum = getPrimeNumber(
                  int.parse(
                    _controller.text.trim(),
                  ),
                );
                setState(() {});
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
                  "Check Prime Number",
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
                isPrimeNum == null
                    ? "Get Output Here..."
                    : isPrimeNum!
                        ? "${_controller.text} is a Prime Number"
                        : "${_controller.text} is Not a Prime Number",
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

  bool getPrimeNumber(int inputNumber) {
    if (inputNumber <= 1) return false;
    if (inputNumber <= 3) return true;
    if (inputNumber % 2 == 0 || inputNumber % 3 == 0) return false;

    for (int i = 5; i * i <= inputNumber; i += 6) {
      if (inputNumber % i == 0 || inputNumber % (i + 2) == 0) {
        return false;
      }
    }
    return true;
  }
}
