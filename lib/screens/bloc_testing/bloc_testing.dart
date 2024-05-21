import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/screens/bloc_testing/bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider =
        BlocProvider.of<BlocTestingProvider>(context, listen: false);
    return Scaffold(
      body: BlocBuilder<BlocTestingProvider, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.toString(),
              style: const TextStyle(
                fontSize: 50,
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              provider.add(CounterEvent.increment);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              provider.add(CounterEvent.decrement);
            },
            child: const Icon(Icons.minimize_outlined),
          ),
        ],
      ),
    );
  }
}
