import 'package:flutter/material.dart';

class PalindromeScreen extends StatefulWidget {
  const PalindromeScreen({super.key});

  @override
  State<PalindromeScreen> createState() => _PalindromeScreenState();
}

class _PalindromeScreenState extends State<PalindromeScreen> {
  final _controller = TextEditingController();
  bool? isPalindrome;
  String palindromeString = '';

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
                  hintText: "Enter String to Check Palindrome",
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
                palindromeString = _controller.text;
                isPalindrome = checkPalindrome(_controller.text.trim());
                _controller.clear();
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
                  "Check Palindrome",
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
                isPalindrome == null
                    ? "Get Output Here..."
                    : isPalindrome!
                        ? "$palindromeString is a Palindrome"
                        : "$palindromeString is Not a Palindrome",
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

  bool checkPalindrome(String inputString) {
    if (inputString.length % 2 == 0) return false;
    int stringLen = inputString.length - 1;
    for (int i = 0; i < (inputString.length + 1) / 2; i++) {
      if (inputString[i] == inputString[stringLen - i]) {
        isPalindrome = true;
      } else {
        return false;
      }
    }
    if (isPalindrome == true) {
      return true;
    }
    return false;
  }
}
