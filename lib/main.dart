import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/screens/all_screens.dart';
import 'package:testing_app/screens/anime/anime_main.dart';
import 'package:testing_app/screens/bloc_testing/bloc.dart';
import 'package:testing_app/screens/bloc_testing/bloc_testing.dart';
import 'package:testing_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => BlocTestingProvider())],
        child: MaterialApp(
          // initialRoute: "splash",
          routes: {
            "allScreen": (context) => const AllScreens(),
            "anime": (context) => const AnimeMainScreen(),
            "splash": (context) => const SplashScreen()
          },
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return const Scaffold(body: CounterScreen());
  }
}
